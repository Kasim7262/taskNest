import 'package:flutter/material.dart';
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
  String currentDate =
  DateTime.now().millisecondsSinceEpoch.toString();

  final FirestoreService firestoreService = FirestoreService();

  Future<void> addTask() async {


    try {

      TaskModel task = TaskModel(
        id: '',
        title: titleController.text,
        description: descriptionController.text,
        createdAt: currentDate,
        isCompleted: false,
      );

      await firestoreService.addTask(task);

      if (!mounted) return;

      Navigator.pop(context);
      // Navigator.of(context).pop();
    } catch (e) {
      debugPrint(e.toString());
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
                  onPressed: () async {
                    await addTask();
                  },
                  child: Text('Add Task'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}


