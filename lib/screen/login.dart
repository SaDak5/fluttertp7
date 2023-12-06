import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../entities/user.dart';
import 'dashboard.dart';
import 'register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "");
  String url = "http://10.0.2.2:8081/login";
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  Future save(user) async {
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': user.email, 'password': user.password}));
    print(res.body);
    if (res.body != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    controller: emailCtrl,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: passwordCtrl,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15.0),
                      primary: Colors.blue, // Change the button color here
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        save(User(emailCtrl.text, passwordCtrl.text));
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      },
                      child: Text("Don't have an account? Register"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
