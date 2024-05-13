import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
    this.onDelete,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: 20,
          bottom: 0,
          left: 20,
        ),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: onDelete,
                icon: Icons.delete,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)
                ),
                backgroundColor: Colors.lime.shade700,
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.lime.shade100,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  checkColor: Colors.white,
                  activeColor: Colors.lime.shade700,
                  side: BorderSide(
                    color: Colors.lime.shade700,
                    width: 2,
                  ),
                ),
                Text(
                  taskName,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.black54,
                    decorationThickness: 2,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
