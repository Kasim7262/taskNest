import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasknest/models/task_model.dart';

class FirestoreService {

  final CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

  Future<bool> addTask(TaskModel task) async {
    try{
      await tasks.add(task.toMap());
      return true;
    } catch(e) {
      return false;
    }
  }

  Stream<QuerySnapshot> getTasks(){
    return tasks.snapshots();
  }

  Future<bool> updateTask(String id, TaskModel task) async {
    try{
      await tasks.doc(id).update(task.toMap());
      return true;
    } catch(e){
      return false;
    }
  }

  Future<void> deleteTask(String id) async {
    await tasks.doc(id).delete();
  }

  Future<bool> updateTaskStatus(String id, bool value) async {

    try {
      await FirebaseFirestore.instance
          .collection('tasks')
          .doc(id)
          .update({
        'isCompleted': value,
      });
      return true;

    } catch (e) {

      return false;
    }
  }

}