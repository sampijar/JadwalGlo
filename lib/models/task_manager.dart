import 'package:bottomsheet/models/task_models.dart';
import 'package:flutter/material.dart';


class TaskManager extends ChangeNotifier {
  final _taskModels = <TaskModel>[];
  List<TaskModel> get taskModel => List.unmodifiable(_taskModels);

  void deleteTask(int index) {
    _taskModels.removeAt(index);
    notifyListeners();
  }

  void addTask(TaskModel taks){
    _taskModels.add(taks);
    notifyListeners();
  }
}