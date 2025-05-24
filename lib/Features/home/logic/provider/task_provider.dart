import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toda_app/Features/home/logic/remot/firebase_services.dart';
import 'package:toda_app/Features/home/models/task_model.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> tasks = [];
  DateTime selectDate = DateTime.now();
  String accountName = '';
  String get accountname => accountName;
  String? _accountImagePath;
  String? get accountImagePath => _accountImagePath;

  void setAccountImagePath(String? path) {
    _accountImagePath = path;
    notifyListeners();
  }

  Future<void> loadAccountImage() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString('profile_image_path');
    if (path != null && File(path).existsSync()) {
      _accountImagePath = path;
      notifyListeners();
    }
  }

  void setAccountName(String firstName, String lastName) {
    accountName = '$firstName $lastName';
    notifyListeners();
  }

  Future<void> getAllTasks() async {
    try {
      List<TaskModel> allTasks = await FirebaseServices.getAllTasks();
      tasks = allTasks;
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();
        final data = userDoc.data();
        if (data != null) {
          final firstName = data['firstName'] ?? '';
          final lastName = data['lastName'] ?? '';
          setAccountName(firstName, lastName);
        }
      }
      notifyListeners();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<void> getTasksByDate() async {
    try {
      List<TaskModel> allTasks = await FirebaseServices.getTasksByDate(
          DateTime(selectDate.year, selectDate.month, selectDate.day));
      tasks = allTasks;
      notifyListeners();
    } on Exception catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> markAsDone(String id) async {
    final taskIndex = tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      tasks[taskIndex].isDone = true;
      await FirebaseServices.updateTask(tasks[taskIndex]);
      notifyListeners();
    }
  }

  TaskModel getTaskById(String id) {
    return tasks.firstWhere((task) => task.id == id);
  }

  Future<void> addTask(TaskModel newTask) async {
    try {
      await FirebaseServices.addTask(newTask).timeout(Duration(seconds: 2),
          onTimeout: () async {
        tasks.add(newTask);
        await getTasksByDate();
      });

      notifyListeners();
    } on Exception catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  changeSelectedDate(DateTime newDate) async {
    selectDate = newDate;
    notifyListeners();
    await getTasksByDate();
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await FirebaseServices.deleteTask(taskId);

      await getTasksByDate();
    } on Exception catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> editTask(TaskModel updatedTask) async {
    try {
      await FirebaseServices.updateTask(updatedTask);
      await getTasksByDate();
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
