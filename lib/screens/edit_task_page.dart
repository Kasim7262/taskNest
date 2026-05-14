import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/firestore_service.dart';

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
    // TODO: implement initState
    super.initState();

    titleController.text = widget.task.title;
    descriptionController.text = widget.task.description;
  }

  void updateTask() async {

    TaskModel updatedTask = TaskModel(
      id: widget.task.id,
      title: titleController.text,
      description: descriptionController.text,
      date: widget.task.date,
      isCompleted: widget.task.isCompleted,
    );

    await firestoreService.updateTask(widget.task.id,updatedTask);

    Navigator.pop(context);
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
                  onPressed: updateTask,
                  child: Text('Update Task'),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
