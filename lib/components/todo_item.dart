import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final bool isChecked;
  final String title;
  final Function toggleCheckboxState;
  final Function deleteTask;

  const TodoItem(
      {super.key,
      required this.isChecked,
      required this.title,
      required this.toggleCheckboxState,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: () {
          deleteTask();
          print('detected longpress');
        },
        title: Text(
          title,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          value: isChecked,
          onChanged: (newValue) => toggleCheckboxState(newValue),
        ));
  }
}

// class TaskCheckbox extends StatelessWidget {
//   final bool checkBoxState;
//   final Function toggleCheckboxState;
//
//   const TaskCheckbox({
//     super.key,
//     required this.checkBoxState,
//     required this.toggleCheckboxState,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       value: checkBoxState,
//       onChanged: (newValue) => toggleCheckboxState(newValue),
//     );
//   }
// }
