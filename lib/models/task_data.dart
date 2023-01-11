import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Avocadoes'),
    Task(name: 'Buy Carrots'),
  ];
  void addNewItem(String newItem) {
    var newTask = Task(name: newItem);
    _tasks.add(newTask);
    notifyListeners();
  }

  //We are doing this so the tasks is not modifiable from outside this class
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void updateTask(Task task) {
    task.toggleTaskDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    print(task);
    _tasks.remove(task);
    notifyListeners();
  }
}
