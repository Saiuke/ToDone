import 'package:flutter/material.dart';
import 'package:to_done/components/todo_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final taskInputController = TextEditingController();
  List toDoList = [
    ['Buy new socks!', true],
    ['Buy new duck', true],
    ['Change car tires', true],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void createNewTask() {
    setState(() {
      var inputText = taskInputController.text;
      if (inputText.isNotEmpty) {
        toDoList.add([inputText, false]);
        taskInputController.clear();
      }
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime.shade50,
      appBar: AppBar(
        title: const Text('To Done!'),
        backgroundColor: Colors.lime,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (BuildContext context, index) {
            return TodoCard(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (val) => checkBoxChanged(index),
              onDelete: (val) => deleteTask(index),
            );
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextField(
                  controller: taskInputController,
                  decoration: InputDecoration(
                    hintText: 'Add new task',
                    filled: true,
                    fillColor: Colors.lime.shade100,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lime.shade700,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lime.shade700,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              backgroundColor: Colors.lime.shade700,
              onPressed: createNewTask,
              child: const Icon(
                color: Colors.white,
                Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
