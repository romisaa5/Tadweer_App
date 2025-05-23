import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toda_app/Features/home/models/task_model.dart';

class FirebaseServices {
  static CollectionReference<TaskModel> getTaskCollection() =>
      FirebaseFirestore.instance.collection('tasks').withConverter<TaskModel>(
          fromFirestore: (snapshot, _) =>
              TaskModel.fromJson(snapshot.data() ?? {}),
          toFirestore: (value, _) => value.toJson());
  static Future<void> addTask(TaskModel task) {
    CollectionReference<TaskModel> taskCollection = getTaskCollection();
    DocumentReference<TaskModel> docReference = taskCollection.doc();
    task.id = docReference.id;
    return docReference.set(task);
  }

  static Future<void> deleteTask(String id) {
    CollectionReference<TaskModel> taskCollection = getTaskCollection();
    return taskCollection.doc(id).delete();
  }

  static Future<List<TaskModel>> getTasks() async {
    CollectionReference<TaskModel> taskCollection = getTaskCollection();
    QuerySnapshot<TaskModel> taskQuery = await taskCollection.get();
    return taskQuery.docs.map((e) => e.data()).toList();
  }

  static Future<void> updateTask(TaskModel task) async {
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(task.id)
        .update(task.toJson());
  }

  static getTasksByDate(DateTime selectedDate) async {
    CollectionReference<TaskModel> taskCollection = getTaskCollection();
    QuerySnapshot<TaskModel> taskQuery = await taskCollection
        .where('date', isEqualTo: Timestamp.fromDate(selectedDate))
        .get();
    return taskQuery.docs.map((e) => e.data()).toList();
  }

  static Future<List<TaskModel>> getAllTasks() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('tasks').get();

    return querySnapshot.docs
        .map((doc) => TaskModel.fromJson(doc.data()))
        .toList();
  }
}
