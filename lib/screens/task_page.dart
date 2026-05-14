import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasknest/models/task_model.dart';
import 'package:tasknest/services/firestore_service.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  final FirestoreService firestoreService = FirestoreService();

  Future<void> addTask() async {
    String currentDate =
    DateTime.now().millisecondsSinceEpoch.toString();

    try {

      TaskModel task = TaskModel(
        id: '',
        title: titleController.text,
        description: descriptionController.text,
        date: currentDate,
        isCompleted: false,
      );

      await firestoreService.addTask(task);

      Navigator.pop(context);
      // Navigator.of(context).pop();
    } catch (e) {

      print(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Enter title here...",
                labelText: "Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 11),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: "Enter description here",
                labelText: "Description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 11),
            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: addTask,
                  child: Text('Add Task'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}


