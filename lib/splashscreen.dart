// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:note_app/note.dart';

class splashcreen extends StatelessWidget {
  const splashcreen({Key? key});

  @override
  Widget build(BuildContext context) {
    // Add a delay of 2 seconds (2000 milliseconds)
    Future.delayed(Duration(seconds: 4), () {
      // Navigate to the "notes" screen
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => notes()));
    });

    return Scaffold(
      backgroundColor: Color(0xFFF7DABC),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Notes App',
              style: TextStyle(
                color: Color(0xFF5E3E33),
                fontSize: 36,
                fontWeight: FontWeight.w700,
                fontFamily: 'DelaGothicOne'
              ),
            ),
            Text(
              'Welcome to notes app',
              style: TextStyle(
                color: Color.fromARGB(255, 152, 115, 102),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
