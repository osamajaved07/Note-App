// ignore_for_file: use_key_in_widget_constructors, camel_case_types, must_be_immutable, prefer_const_constructors

// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class editnote extends StatefulWidget {
  DocumentSnapshot docToEdit;
  editnote({required this.docToEdit});
  // const editnote({super.key});

  @override
  State<editnote> createState() => _editnoteState();
}

class _editnoteState extends State<editnote> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  void initState() {
    title = TextEditingController(text:  widget.docToEdit['title'] as String);
    content = TextEditingController(text:  widget.docToEdit['content'] as String);
    super.initState();
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFFF7DABC),
        actions: [
          TextButton(onPressed: (){
            widget.docToEdit.reference.update(
              {
              'title': title.text,
              'content': content.text}).whenComplete(() => Navigator.pop(context)
              
            );
            // ref.add({
            //   'title': title.text,
            //   'content': content.text
            // }).whenComplete(() => Navigator.pop(context));
          }, child: Text("Save",style: TextStyle(color: Color(0xFF5E3E33),fontWeight: FontWeight.w600),)),

          TextButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Delete"),
          content: Text("Are you sure you want to delete this note?"),
          actions: [
            TextButton(
              child: Text("Cancel",style: TextStyle(color: Color(0xFF5E3E33),fontWeight: FontWeight.w600),),
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert dialog.
              },
            ),
            TextButton(
              child: Text("Delete",style: TextStyle(color: Color(0xFF5E3E33),fontWeight: FontWeight.w600),),
              onPressed: () {
                // Delete the document and close the alert dialog.
                widget.docToEdit.reference.delete();
                Navigator.of(context).pop();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  },
  child: Text("Delete",style: TextStyle(color: Color(0xFF5E3E33),fontWeight: FontWeight.w600),),
)

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
                padding: const EdgeInsets.only(left:8.0,right: 8),
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
                      color: Color.fromARGB(255, 180, 180, 180)
                      ),
                      
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }}