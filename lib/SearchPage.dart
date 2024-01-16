import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goole_notes/sqfliteDatabase/db.dart';

import 'MyNotesModel.dart';
import 'colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List<int> SearchResultIDs = [];
  List<Note?> SearchResultNotes = [];
  bool isLoading = false;

  void SearchResults(String query) async{
    SearchResultNotes.clear();
    setState(() {
      isLoading = true;
    });
    final ResultIds = await NotesDatabase.instance.getNoteString(query); //[1,2,3,4]
    List<Note?> SearchResultNotesLocal = [];  //[note1,note2]
    ResultIds.forEach((element) async{
      final SearchNote = await NotesDatabase.instance.readOneNote(element);
      SearchResultNotesLocal.add(SearchNote);
      setState(() {
        SearchResultNotes.add(SearchNote);
      });
    });
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(color: white.withOpacity(0.1)),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: white.withOpacity(0.2)),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon:Icon(Icons.arrow_back,
                        size: 25,
                        color: white.withOpacity(0.5),),
                    ),

                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search note",
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            color: white.withOpacity(0.5),
                            fontSize: 18
                          )
                        ) ,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}
