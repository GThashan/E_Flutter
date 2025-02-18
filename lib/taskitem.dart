
import 'package:flutter/material.dart';

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
               
                IconButton(
                  onPressed: () {
                 
                  },
                  icon: Icon(Icons.check_circle, color: Colors.green),
                ),
             
                IconButton(
                  onPressed: () {
             
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