

import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/Utilities/buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
   VoidCallback onSave;
   VoidCallback onCancel;
   DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.lightBlue[300],
      content: SizedBox(
        height: 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add New Task...",
              ),
            ),

            // two buttons for save and cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: "Save", onPressed: onSave),

                const SizedBox(
                  width: 10,
                ),
                //cancel button

                MyButton(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
