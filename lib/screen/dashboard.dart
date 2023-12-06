import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:tp70/template/navbar.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar('Dashboard'),
      backgroundColor: Colors.blueGrey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 50.0,
            ),
            ListTile(
              title: const Text('Etudiant'),
              onTap: () {
                Navigator.pushNamed(context, '/students');
              },
            ),
            ListTile(
              title: const Text('Classes'),
              onTap: () {
                Navigator.pushNamed(context, '/class');
              },
            ),
            ListTile(
              title: const Text('Formations'),
              onTap: () {
                Navigator.pushNamed(context, '/formation');
              },
            ),
            ListTile(
              title: const Text('Departments'),
              onTap: () {
                Navigator.pushNamed(context, '/departments');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 40.0,
                fontFamily: 'Agne',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 40.0,
                fontFamily: 'Agne',
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 148, 67, 67),
              ),
            ),
            SizedBox(height: 20.0),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Agne',
                color: const Color.fromARGB(255, 154, 65, 65),
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('Some other animated text'),
                  TypewriterAnimatedText('welcom Amine '),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
