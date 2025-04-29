import 'package:flutter/material.dart';
import 'package:toda_app/Features/home/logic/remot/firebase_services.dart';
import 'package:toda_app/Features/home/models/task_model.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> tasks = [];
  DateTime selectDate = DateTime.now();
  Future<void> getAllTasks() async {
    try {
      List<TaskModel> allTasks = await FirebaseServices.getTasks();
      tasks = allTasks;
      notifyListeners();
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> addTask(TaskModel newTask) async {
    try {
      await FirebaseServices.addTask(newTask);
    } on Exception catch (e) {
      print(e);
    }
  }

  changeSelectedDate(DateTime newDate) {
    selectDate = newDate;
    notifyListeners();
  }
}
