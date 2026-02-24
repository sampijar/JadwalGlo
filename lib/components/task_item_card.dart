
import 'package:bottomsheet/models/task_models.dart';
import 'package:flutter/material.dart';

class TaskItemCard extends StatelessWidget {
  final TaskModel task;
  final Function() onPressed;
  const TaskItemCard({Key? key, required this.task, required this.onPressed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amberAccent[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(task.taskName),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text('Are You Sure?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('No'),
                    ),
                     TextButton(
                      onPressed: onPressed,
                      child: Text('Yes'),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(Icons.delete_forever_rounded),
          ),
        ],
      ),
    );
  }
}
