import 'Db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleController = TextEditingController();
  var database = DatabaseHelper();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nova Tarefa"),
        ),
        body: Container(
          child: Column(
            children: [_buildForm()],
          ),
        ));
  }

  Widget _buildForm() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Nome da tarefa",
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 20),
              controller: titleController,
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await database.saveTask(titleController.text);
                Navigator.pop(context);
              },
              child: Text("Adicionar Tarefa"))
        ],
      ),
    );
  }
}

class Task {
  final id;
  final title;

  Task(this.id, this.title);
}
