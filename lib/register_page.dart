import 'package:flutter/material.dart';

import 'login_page.dart' show LoginPage;

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: Colors.teal,
      body: Padding(
        padding: EdgeInsets.all(20),
      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image(
                image: AssetImage("images/logo.png"),
                width: 250, 
                height: 250, 
              ),
            TextField(
              decoration: InputDecoration(labelText: "UserName"),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
               
              },
               style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, 
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), 
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), 
                ),
              child: Text("Register"),
            ),
            TextButton(
              onPressed: () {
               
                Navigator.push(context,  MaterialPageRoute(builder: (context) => LoginPage()),);
              },
              
              child: Text("Already have an account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
