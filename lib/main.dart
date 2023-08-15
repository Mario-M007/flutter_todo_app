//import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home()
));


class Todo {
  
  String task;
  Todo({required this.task});

}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  List<Todo> todos = [
  ];


  TextEditingController controller = TextEditingController();


  Widget addTodo(todos, int index){
    return Container(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: EdgeInsets.all(10),
      color:  Color.fromARGB(78, 96, 125, 139),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            todos.task,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              removeTodo(index);
            },
          ),
        ],
      ),
    );
  }


  void displayInputField() {
    showDialog(
      context: context,
      builder: (context) {
        String newTask = '';

        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(
            controller: controller,
            onChanged: (value) {
              newTask = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (newTask.isNotEmpty) {
                  setState(() {
                    todos.add(Todo(task: newTask));
                    controller.clear();
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Todo App"),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 78, 93, 177),
    ),
    body: Column(
      children: todos.map((tods) {
        int index = todos.indexOf(tods);
        return addTodo(tods,index);
        }).toList(),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        displayInputField();
      },
      child: Text("add"),
      backgroundColor: Color.fromARGB(255, 237, 191, 51),
    ),
  );

  }
}



