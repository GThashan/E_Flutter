import 'package:flutter/material.dart';

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
                      color: Color.fromARGB(255, 86, 66, 66),
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
                    
                    TaskItem(task: "Web"),
                    TaskItem(task: "API"),
                    TaskItem(task: "App"),
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

class TaskItem extends StatelessWidget {
  final String task;

  TaskItem({required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              task,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                // Complete Button
                IconButton(
                  onPressed: () {
                    // Complete Task Logic Here
                  },
                  icon: Icon(Icons.check_circle, color: Colors.green),
                ),
                // Delete Button
                IconButton(
                  onPressed: () {
                    // Delete Task Logic Here
                  },
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}