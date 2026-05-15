import 'package:flutter/material.dart';
import 'package:tasknest/models/task_model.dart';
import 'package:tasknest/services/firestore_service.dart';
import 'package:tasknest/widget/custom_textfield.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  String currentDate = DateTime.now().millisecondsSinceEpoch.toString();

  final FirestoreService firestoreService = FirestoreService();

  Future<void> addTask() async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      TaskModel task = TaskModel(
        id: '',
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        createdAt: currentDate,
        isCompleted: false,
      );

      await firestoreService.addTask(task);

      messenger.showSnackBar(
        const SnackBar(
          content: Text("Task Added Successfully"),
        ),
      );

    } catch (e) {

      messenger.showSnackBar(
        const SnackBar(
          content: Text("Failed to add task"),
        ),
      );

      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextField(controller: titleController, hint: 'Title'),
            SizedBox(height: 11),
            CustomTextField(controller: descriptionController, hint: 'Description'),
            SizedBox(height: 11),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  addTask();
                  Navigator.pop(context);
                },
                child: Text('Add Task'),
              ),
            ),
            SizedBox(height: 11),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
