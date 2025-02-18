import 'package:flutter/material.dart';

import 'register_page.dart';

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text("data"),
        //   backgroundColor: Colors.blueGrey[900],
        // ),
        backgroundColor: Colors.teal,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
        
              Image(
                image: AssetImage("images/logo.png"),
                width: 250, 
                height: 250, 
              ),
              SizedBox(height: 20), 
             
              ElevatedButton(
                 onPressed: () {
               
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, 
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), 
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), 
                ),
                child: Text("Get Started"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}