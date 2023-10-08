// ignore_for_file: camel_case_types, unused_import, depend_on_referenced_packages, use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors, unused_local_variable


import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app/addnote.dart';
import 'package:note_app/editnote.dart';


class notes extends StatefulWidget {
  @override
  State<notes> createState() => _notesState();
}

class _notesState extends State<notes> {
  
  final ref = FirebaseFirestore.instance.collection("notes");
    final List<Color> noteColors = [
    Color.fromARGB(255, 244, 146, 54),
    Colors.blue,
    Colors.green,
    Color.fromARGB(255, 173, 157, 14),
    Colors.purple,
    
    Colors.teal,
    Colors.red,
    // Add more colors as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF7DABC),
        title: Text(
          'Note App',
          style: TextStyle(color: Color(0xFF5E3E33), fontWeight: FontWeight.w500, fontFamily: 'DelaGothicOne',),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          StreamBuilder(
            stream: ref.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: snapshot.hasData ? snapshot.data?.docs.length : 0,
                itemBuilder: (_, index) {
                  int colorIndex = index % noteColors.length;
                  Color noteColor = noteColors[colorIndex];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => editnote(
                            docToEdit: snapshot.data!.docs[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 247, 238, 230),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 16,
                        bottom: 10,
                      ),
                      height: 50,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0, right: 8),
                          child: Text(
                            
                            snapshot.data?.docs[index]['title'],
                            style: TextStyle(
                              fontWeight:FontWeight.w500,
                              fontSize: 18,
                              color: noteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          Positioned(
            
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => addnote()));
                },
                icon: Icon(Icons.add),
                label: Text('Add Note',
                style: TextStyle(
                  
                  fontSize: 14,
                  
                  fontFamily: 'DelaGothicOne'
              ),),
              ),
            ),
          ),

        

        ],
      ),
    );
  }
}
