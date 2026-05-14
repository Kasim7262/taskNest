import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasknest/models/task_model.dart';

class FirestoreService {

  final CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

  Future<void> addTask(TaskModel task) async {
    await tasks.add(task.toMap());
  }

  Stream<QuerySnapshot> getTasks(){
    return tasks.snapshots();
  }

  Future<void> updateTask(String id, TaskModel task) async {
    await tasks.doc(id).update(task.toMap());
  }

  Future<void> deleteTask(String id) async {
    await tasks.doc(id).delete();
  }

  Future<void> updateTaskStatus(String id, bool value) async {
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(id)
        .update({
      'isCompleted': value,
    });
  }

}