import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toda_app/Features/home/logic/remot/firebase_services.dart';
import 'package:toda_app/Features/home/models/task_model.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> tasks = [];
  DateTime selectDate = DateTime.now();

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
      tasks.removeWhere((task) => task.id == taskId);
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

  Future<void> editTask(TaskModel updatedTask) async {
    await FirebaseServices.updateTask(updatedTask);
    int index = tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      tasks[index] = updatedTask;
      notifyListeners();
    }
  }
}
