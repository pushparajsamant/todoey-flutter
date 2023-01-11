import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/components/todo_item.dart';

import '../models/task.dart';
import '../models/task_data.dart';

class TodoList extends StatelessWidget {
  final Function toggleCheckboxState;

  const TodoList({super.key, required this.toggleCheckboxState});
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final Task currentTask = taskData.tasks[index];
            return TodoItem(
              isChecked: currentTask.isDone,
              title: currentTask.name,
              toggleCheckboxState: (newValue) =>
                  taskData.updateTask(currentTask),
              deleteTask: () => taskData.deleteTask(currentTask),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
