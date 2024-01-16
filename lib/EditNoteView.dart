import 'package:flutter/material.dart';
import 'package:goole_notes/colors.dart';
import 'package:goole_notes/sqfliteDatabase/db.dart';

import 'MyNotesModel.dart';
import 'NoteView.dart';

class EditNoteView extends StatefulWidget {
   EditNoteView({super.key, required this.note});
  
  Note note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  
  late String NewTitle;
  late String NewNoteDet;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.NewTitle = widget.note!.title.toString();
    this.NewNoteDet = widget.note!.content.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Note newNote = Note(id: widget.note!.id,
                  pin: false,
                  title: NewTitle,
                  content: NewNoteDet,
                  createdTime: widget.note!.createdTime,
              );
              await NotesDatabase.instance.updateNote(newNote);
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context)=>NoteView(note: newNote)));
            },
            icon: Icon(Icons.save_outlined),
            splashRadius: 17,
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          children: [
            Form(
              child: TextFormField(
                initialValue: NewTitle,
                cursorColor: white,
                onChanged: (value){
                  NewTitle = value;
                },
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Title",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ),
              ),
            ),
            Container(
              height: 300,
              child: Form(
                child: TextFormField(
                  onChanged: (value){
                    NewNoteDet = value;
                  },
                  initialValue: NewNoteDet,
                  cursorColor: white,
                  keyboardType: TextInputType.multiline,
                  minLines: 50,
                  maxLines: null,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Note",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.withOpacity(0.8),
                    )
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
