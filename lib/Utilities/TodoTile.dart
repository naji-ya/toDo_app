import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final taskName;
  bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22, top: 22),
      child: Column(
        children: [
          Slidable(
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: deleteFunction,
                  icon: Icons.delete,
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.lightBlue.shade700,
                  borderRadius: BorderRadius.circular(15),
                ),
              ],
            ),
            child: Container(
              height: 75,
              width: 500,
              decoration: BoxDecoration(
                  color: Colors.lightBlue[700],
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    // checkbox

                    Checkbox(
                      value: taskCompleted,
                      onChanged: onChanged,
                      activeColor: Colors.black,
                    ),

                    //task name
                    Text(
                      taskName,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
