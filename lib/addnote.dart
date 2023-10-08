// ignore_for_file: prefer_const_constructors, camel_case_types, use_key_in_widget_constructors, must_be_immutable, unused_import

// import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class addnote extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('notes');

  // const addnote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFFF7DABC),
        actions: [
          TextButton(onPressed: (){
            ref.add({
              'title': title.text,
              'content': content.text
            }).whenComplete(() => Navigator.pop(context));
          }, child: Text("Save",style: TextStyle(color: Color(0xFF5E3E33),fontWeight: FontWeight.w600,fontSize: 16),))
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),

        child: Column(
          children: [
            Container(
              
              decoration: BoxDecoration(
                border: Border.all()
      
              ),
              child: Padding(
                padding: const EdgeInsets.only(left:8.0, right: 8),
                child: TextField(
                  controller: title,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 180, 180, 180)
                    ),
                    
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                
                decoration: BoxDecoration(
                  border: Border.all()
            
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0, right: 8),
                  child: TextField(
                    controller: content,
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(
                      hintText: 'Add content here',hintStyle: TextStyle(
                      color: Color.fromARGB(255, 180, 180, 180)),
                      
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}