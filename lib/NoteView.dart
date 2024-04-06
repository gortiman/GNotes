import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goole_notes/HomePage.dart';
import 'package:goole_notes/colors.dart';
import 'package:goole_notes/services/db.dart';

import 'EditNoteView.dart';
import 'MyNotesModel.dart';

class NoteView extends StatefulWidget {
  //  NoteView({super.key, required this.note});
  //
  // Note note;
  Note? note;
  NoteView({required this.note});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  String note =
      "THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar:AppBar(
        backgroundColor: bgColor,
        elevation: 0.0,
        actions: [
          IconButton(
            splashRadius: 17,
              onPressed: ()async{
              await NotesDatabase.instance.pinNote(widget.note);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
              icon: Icon(widget.note!.pin ? Icons.push_pin : Icons.push_pin_outlined),
          ),


          IconButton(
            splashRadius: 17,
            onPressed: () async{
              await NotesDatabase.instance.archNote(widget.note);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
            },
            icon: Icon(widget.note!.isArchieve ? Icons.archive : Icons.archive_outlined),
          ),


          IconButton(
              onPressed: () async{
                await NotesDatabase.instance.deleteNote(widget.note);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: Icon(Icons.delete_forever_outlined)
          ),


          IconButton(
            splashRadius: 17,
            onPressed: () async{
              // await NotesDatabase.instance.archNote(widget.note);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => EditNoteView()));
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditNoteView(note : widget.note)));
            },
            icon: Icon(Icons.edit_outlined),
          ),


        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          // Text("HEADING",
          // style: TextStyle(
          //   color: Colors.white,
          //   fontSize: 15,
          // ),),
          // SizedBox(height: 10,),
          // Text(note,
          // style: TextStyle(
          //   color: Colors.white,
          // ))
        //],

          Text(widget.note!.title , style: TextStyle(color: Colors.white , fontSize: 23 , fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text(widget.note!.content,style: TextStyle(color: Colors.white),)
        ],
        ),
      ),
    );
  }
}
