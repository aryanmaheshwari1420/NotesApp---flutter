import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:notesapp/models/note.dart';
import 'package:notesapp/pages/add_newNote.dart';
import 'package:notesapp/provider/notes_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    NotesProvider notesProvider = Provider.of<NotesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("NotesApp"),
        centerTitle: true,
      ),
      body: SafeArea(
        child:(notesProvider.notes.length>0)? GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2), // ek line me 2 widgets aa skte hai
          itemCount: notesProvider.notes.length,
          itemBuilder: (context, index) {
            Note currentNote = notesProvider.notes[index];
            return GestureDetector(
              onTap: () {
                // for update
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewNote(isUpdate: true,note: currentNote),
                    ));
              },
              onLongPress: () {
                // for delete
                notesProvider.deleteNote(currentNote);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    )),
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(10),
                color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentNote.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      currentNote.content!,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ),
            );
          },
        ):const Center(child: Text("Add a New Note")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => const NewNote(isUpdate: false,),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
