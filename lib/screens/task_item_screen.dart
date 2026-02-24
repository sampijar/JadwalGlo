import 'package:bottomsheet/models/task_models.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TaskItemScreen extends StatefulWidget {
  final Function(TaskModel) onCreate;
  const TaskItemScreen({Key? key, required this.onCreate}) : super(key: key);

  @override
  State<TaskItemScreen> createState() => _TaskItemScreenState();
}

class _TaskItemScreenState extends State<TaskItemScreen> {
  // ignore: non_constant_identifier_names
  final _TaskNameController = TextEditingController();
  // ignore: unused_field
  String _taskName = '';

  @override
  void initState() {
    super.initState();
    _TaskNameController.addListener(() {
      _taskName = _TaskNameController.text;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _TaskNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            //buildTaskNameField
            buildNameField(),
            SizedBox(
              height: 20,
            ),
            buildButton(),
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Task Title'),
        SizedBox(height: 10,),
        TextField(
          controller: _TaskNameController,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: 'E.d study',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildButton() {
    return ElevatedButton(
      onPressed: () {
        final taskItem = TaskModel(id: Uuid().v1(),
         taskName: _TaskNameController.text,
        );
        widget.onCreate(taskItem);
      }, 
      child: Text('Create Task'),
    );
  } 
}
