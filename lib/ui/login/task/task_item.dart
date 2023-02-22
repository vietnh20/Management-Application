import 'package:final_nguyenhoangviet/model/task.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function(Task task) onClick;
  final Function(Task task)? onDelete;
  const TaskItem(
      {super.key, required this.task, required this.onClick, this.onDelete});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          InkWell(
            child: Column(
              children: [
                Text(task.title),
                Text(
                  task.endDate.toString() + '-' + task.status,
                )
              ],
            ),
            onTap: () => onClick(task),
          ),
          const Spacer(),
          IconButton(
              onPressed: onDelete == null ? null : () => onDelete!(task),
              icon: const Icon(Icons.delete, color: Colors.red)),
        ],
      ),
    );
  }
}
