import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goole_notes/colors.dart';

import 'EditNoteView.dart';
import 'MyNotesModel.dart';

class NoteView extends StatefulWidget {
   NoteView({super.key, required this.note});

  Note note;

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
              onPressed: (){},
              icon: Icon(Icons.push_pin_outlined),
          ),
          IconButton(
            splashRadius: 17,
            onPressed: (){},
            icon: Icon(Icons.archive_outlined),
          ),
          IconButton(
            splashRadius: 17,
            onPressed: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context) => EditNoteView()));
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditNoteView(note : widget.note)));
            },
            icon: Icon(Icons.edit_outlined),
          ),
        ],
      ),
      body: Container(
        child: Column(children: [
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

          Text(widget.note.title , style: TextStyle(color: Colors.white , fontSize: 23 , fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text(widget.note.content,style: TextStyle(color: Colors.white),)
        ],
        ),
      ),
    );
  }
}
