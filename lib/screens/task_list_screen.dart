import 'package:bottomsheet/components/task_item_card.dart';
import 'package:flutter/material.dart';
import 'package:bottomsheet/models/task_manager.dart';


class TaskListScreen extends StatelessWidget {
  final TaskManager manager;

  const TaskListScreen({ Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskItems = manager.taskModel;
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: taskItems.length, 
        itemBuilder: (BuildContext context, int index) { 
          final item = taskItems[index];
          return TaskItemCard(
            key: Key(item.id),
            task: item,
            onPressed: () {
              manager.deleteTask(index);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${item.taskName} Deleted'),),);
            },
          );
         }, 
         separatorBuilder: (context, index) { 
           return SizedBox(
             height: 16,
           );
        },
      ),
    );
  }
}

