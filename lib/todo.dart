import 'package:flutter/material.dart';

import 'taskitem.dart' show TaskItem;

class Todo extends StatelessWidget {
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
                    onPressed: () {
                     
                    },
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
                child: ListView(
                  children: [
                    
                    TaskItem(task: "Need to complete task 1"),
                    TaskItem(task: "Need to complete task 2"),
                    TaskItem(task: "Need to complete task 3"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
