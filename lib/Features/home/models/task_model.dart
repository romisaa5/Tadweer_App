// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String name;
  String details;
  DateTime date;
  String category;
  bool isDone;
  String id;

  TaskModel({
    required this.name,
    required this.details,
    required this.date,
    required this.category,
     this.id='',
    this.isDone = false,
  });
  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            name: json['name'],
            details: json['details'],
            date: (json['date'] as Timestamp).toDate(),
            category: json['category'],
            id: json['id'],
            isDone: json['isDone']);
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'details': details,
      'date': Timestamp.fromDate(date),
      'category': category,
      'id':id,
      'isDone': isDone
    };
  }
}
