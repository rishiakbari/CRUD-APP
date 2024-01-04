import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/style/appstyle.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({super.key});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {



  TextEditingController titleController = TextEditingController();
  TextEditingController mainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
      backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Note Title",
              ),
            ),
            const SizedBox(height: 8,),
            const Text('date'),
            const SizedBox(height: 28,),

            TextField(
              controller: mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration:const InputDecoration(
                border: InputBorder.none,
                hintText: "Note content",
              ),
            )
          ],
        ),
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: AppStyle.accentColor,
          onPressed: () async{
            FirebaseFirestore.instance.collection('Note').add({
              "note_title": titleController.text,
              "Creation_date": FieldValue.serverTimestamp(),
              "note_content": mainController.text,
            }).then((value) {
              
            }); 
          },
          child:const Icon(Icons.save),
          ),
    );
  }
}