import 'package:bottomsheet/components/profile_sheet.dart';
import 'package:bottomsheet/models/task_manager.dart';
import 'package:bottomsheet/screens/empty_taskscreen.dart';
import 'package:bottomsheet/screens/task_item_screen.dart';
import 'package:bottomsheet/screens/task_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atur Jadwalmu'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20)
                ),
              ),
              context: context, 
              builder: (context) => ProfileSheet());
          }, 
          icon: Icon(Icons.account_circle))
        ],
      ),
      body: buildTaskScreen(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 140, right: 140),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            final manager = Provider.of<TaskManager>(context, listen: false);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskItemScreen(
                  onCreate: (task) {
                    manager.addTask(task);
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildTaskScreen() {
    return Consumer<TaskManager>(builder: ((context, manager, child) {
      if (manager.taskModel.isNotEmpty) {
        return TaskListScreen(
          manager: manager,
        );
      } else {
        return const EmptyTaskScreen();
      }
    }));
  }
}
