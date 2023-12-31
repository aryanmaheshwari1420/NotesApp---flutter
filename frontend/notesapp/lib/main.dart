import 'package:flutter/material.dart';
import 'package:notesapp/pages/homepage.dart';
import 'package:notesapp/provider/notes_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp()); }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}); 

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ 
        ChangeNotifierProvider(
          create: (context) => NotesProvider(),
        ),
      ],
      child: MaterialApp(  
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
