// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
  String name;
  String details;
  DateTime date;
  String category;
  bool isDone;

  TaskModel({
    required this.name,
    required this.details,
    required this.date,
    required this.category,
    this.isDone=false,
  });
}
