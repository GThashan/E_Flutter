import 'package:flutter/material.dart';
import 'register_page.dart';
import 'todo.dart' show Todo;
import 'package:http/http.dart' as http;
import 'dart:convert'; 
import 'config.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;

  void loginUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var regBody = {
        "email": emailController.text,
        "password": passwordController.text
      };

      try {
        var headers = {"Content-Type": "application/json"};
        var response = await http.post(
          Uri.parse(login),  
          headers: headers,
          body: jsonEncode(regBody),
        );

        if (response.statusCode == 201) {
          var jsonResponse = jsonDecode(response.body);
          if (jsonResponse['status']) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Todo()));
          } else {
            print("Something went wrong: ${jsonResponse['message']}");
          }
        } else {
          print("Server error: ${response.statusCode}");
        }
      } catch (e) {
        print("Error: $e");
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Image(
                image: AssetImage("images/logo.png"),
                width: 250,
                height: 250,
              ),
              TextField(
                controller: emailController,  
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.white),
                  errorText: _isNotValidate ? "Email is required" : null,
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              TextField(
                controller: passwordController,  
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.white),
                  errorText: _isNotValidate ? "Password is required" : null,
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: loginUser,  
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text("Login"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text("Don't have an account? Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
