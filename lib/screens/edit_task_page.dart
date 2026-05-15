import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/firestore_service.dart';
import '../widget/custom_textfield.dart';

class EditTaskPage extends StatefulWidget {

  final TaskModel task;

  const EditTaskPage({super.key, required this.task});

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  final FirestoreService firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();

    titleController.text = widget.task.title;
    descriptionController.text = widget.task.description;
  }

  Future<void> updateTask() async {
    final messenger = ScaffoldMessenger.of(context);

    try {

      TaskModel updatedTask = TaskModel(
        id: widget.task.id,
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        createdAt: widget.task.createdAt,
        isCompleted: widget.task.isCompleted,
      );

      await firestoreService.updateTask(
        widget.task.id,
        updatedTask,
      );

      messenger.showSnackBar(
        const SnackBar(
          content: Text("Task Updated"),
        ),
      );

    } catch (e) {

      messenger.showSnackBar(
        const SnackBar(
          content: Text("Update Failed"),
        ),
      );
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
      appBar: AppBar(
        title: Text("Edit Task"),
      ),
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
                    updateTask();
                    Navigator.pop(context);
                  },
                  child: Text('Update Task'),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
