import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:noteapp/screens/note_editor.dart';
import 'package:noteapp/screens/note_reader.dart';
import 'package:noteapp/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> { 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff000000),
      appBar:AppBar(
        elevation: 0,
        title: const Text('App data'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
           const Text('your resent note',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('Note').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(snapshot.hasData){
                    return GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    children: snapshot.data!.docs
                    .map((note)=> noteCard(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteReaderScreen(note)));
                    }, note))
                    .toList(),
                    );
                  }
                  return const Text("there no notes",
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  );
                }
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const NoteEditorScreen()));
      }, 
      label:const Text('Add Note'),
      icon: const Icon(Icons.add),
      ),

    );
  }
}