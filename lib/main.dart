// ignore_for_file: duplicate_import, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:note_app/note.dart';
import 'package:note_app/splashscreen.dart';

import 'firebase_options.dart';

// import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF7DABC)),
        useMaterial3: true,
      ),
      home: splashcreen(),
    );
  }
}

// 