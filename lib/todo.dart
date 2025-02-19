import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'config.dart'; 

import 'taskitem.dart' show TaskItem;

class Todo extends StatefulWidget {
  final String userId;

  Todo({required this.userId});

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  TextEditingController taskController = TextEditingController();
  List<dynamic> tasks = [];

  @override
  void initState() {
    super.initState();
    fetchUserTodos();
  }


  Future<void> fetchUserTodos() async {
    try {
      var response = await http.get(Uri.parse("$getUserTodos/${widget.userId}"));

      if (response.statusCode == 200) {
        setState(() {
          tasks = jsonDecode(response.body);
        });
      } else {
        print("Error fetching tasks: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

 
  Future<void> createTask() async {
    if (taskController.text.isNotEmpty) {
      try {
        var response = await http.post(
         Uri.parse("$todos/${widget.userId}"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"title": taskController.text}),
        );

        if (response.statusCode == 201) {
          taskController.clear();
          fetchUserTodos(); 
        } else {
          print("Error creating task: ${response.statusCode}");
        }
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('images/user.jpg'),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Tasks To Do",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Color.fromARGB(255, 43, 63, 48),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: taskController,
                      decoration: InputDecoration(
                        hintText: "Enter new task",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: createTask,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return TaskItem(task: tasks[index]['title']);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
