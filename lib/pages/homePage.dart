import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/Utilities/dialogBox.dart';

import '../Utilities/TodoTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final conTroller = TextEditingController();
  List toDoList = [];
  // method for when checkbox tapped

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //save method
  void saveNewTask() {
    setState(() {
      toDoList.add([conTroller.text, false]);
      conTroller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: conTroller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[200],
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[700],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
          elevation: 0,
          title: const Center(
            child: Text("To Do App",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue[700],
          onPressed: () {
            createNewTask();
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) => TodoTile(
            deleteFunction: (context) => deleteTask(index),
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          ),
        ));
  }
}
