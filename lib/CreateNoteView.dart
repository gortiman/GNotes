import 'package:flutter/material.dart';
import 'package:goole_notes/HomePage.dart';
import 'package:goole_notes/MyNotesModel.dart';
import 'package:goole_notes/colors.dart';
import 'package:goole_notes/services/db.dart';

class CreateNoteView extends StatefulWidget {
  const CreateNoteView({super.key});

  @override
  State<CreateNoteView> createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends State<CreateNoteView> {
  TextEditingController title = new TextEditingController();
  TextEditingController content = new TextEditingController();
  @override
  void dispose(){
    super.dispose();
    title.dispose();
    content.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0.0,
        actions: [
          IconButton(onPressed: () async{
            await NotesDatabase.instance.insertEntry(Note(pin: false, isArchieve: false, title: title.text, content: content.text, createdTime: DateTime.now()));
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
          }, 
              icon: Icon(Icons.save_outlined))
        ],
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          children: [
            TextField(
              cursorColor: white,
              style: TextStyle(fontSize: 25, color: Colors.white , fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Title",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.withOpacity(0.8))),
            ),
            Container(
              height: 300,
              child: TextField(
                cursorColor: white,
                keyboardType:  TextInputType.multiline,
                minLines: 50,
                maxLines: null,
                style: TextStyle(fontSize: 17, color: Colors.white),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Note",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.withOpacity(0.8))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
