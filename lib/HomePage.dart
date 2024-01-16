import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goole_notes/CreateNoteView.dart';
import 'package:goole_notes/SearchPage.dart';
import 'package:goole_notes/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:goole_notes/sqfliteDatabase/db.dart';
// import 'package:goole_notes/test_code_folder/db_test.dart';
// import 'package:goole_notes/test_code_folder/test.dart';
import 'package:goole_notes/MyNotesModel.dart';

import 'NoteView.dart';
import 'SideMenuBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isLoading = true;
  late List<Note> notesList;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  String note =
      "THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE";
  String note1 = "THIS IS NOTE THIS IS NOTE THIS IS NOTE";


  // Future createEntry() async{
  //   await NotesDatabse.instance.InsertEntry();
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // createEntry();
    // getAllNotes();
    // getOneNote();
    createEntry(Note(pin: false, title: "Code with dhruv", content: "This is dhruv telling ", createdTime: DateTime.now()));
  }

  // This line defines a function named createEntry.
  // It returns a Future indicating that it performs an asynchronous operation.
  // The async keyword is used to denote asynchronous code.
  Future createEntry(Note note) async{
    await NotesDatabase.instance.insertEntry(note);
    // await NotesDatabase.instance.InsertEntry(); // This line awaits the result of calling the insertEntry method on the NotesDatabase.instance.
    // It inserts an entry into the database.
    // The await keyword is used to wait for the completion of the asynchronous operation.
  }

  Future<String?> getAllNotes() async{
    // await NotesDatabase.instance.readAllNotes();
    // this.notesList =  await NotesDatabase.instance.readAllNotes();
    this.notesList = await NotesDatabase.instance.readAllNotes();
    setState(() {
      isLoading = false;
    });
  }

  Future<String?> getOneNote(int id) async {
    await NotesDatabase.instance.readOneNote(id);
  }

  Future updateOneNote(Note note) async{
    await NotesDatabase.instance.updateNote(note);
  }

  Future deleteNote(Note note) async {
    await NotesDatabase.instance.deleteNote(note);
  }
  @override
  Widget build(BuildContext context) {
    return isLoading ? Scaffold(backgroundColor: bgColor, body: Center(
      child: CircularProgressIndicator(color: Colors.white,),
    ),)
        :Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateNoteView()));
        },
        backgroundColor: cardColor,
        child:Icon(Icons.add, size: 45,)
      ),
      key: _drawerKey,
      drawer: SideMenuBar(),
      endDrawerEnableOpenDragGesture: true,
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// ----------
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => ArchiveView(),
              //       ),
              //     );
              //   },
              //   child: SizedBox(
              //     height: 140,
              //     child: Hero(
              //       tag: 'heroTag',
              //       child: ClipRRect(
              //         borderRadius: BorderRadius.circular(1002),
              //         child: Image.network(
              //           'https://images.pexels.com/photos/15239/flower-roses-red-roses-bloom.jpg?auto=compress&cs=tinysrgb&w=300',
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10 ),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: black.withOpacity(0.2),
                      spreadRadius:  1,
                      blurRadius: 3,
                    )
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _drawerKey.currentState!.openDrawer();
                          },
                            icon:Icon(Icons.menu,
                              color: white,
                            ),
                        ),
                        Container(
                          height: 55,
                          // width: 200,
                          // color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                  overlayColor: MaterialStateColor.resolveWith((states) =>
                                      white.withOpacity(0.1)),
                                ),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
                                },
                                child: Text(
                                  "Search Notes",
                                  style: TextStyle(
                                    color: white.withOpacity(0.5),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Container(
                     margin: EdgeInsets.symmetric(horizontal: 10),
                      //color: Colors.green,
                      child: Row(
                        children: [
                          TextButton(
                            style: ButtonStyle(
                                overlayColor:
                                MaterialStateColor.resolveWith(
                                        (states) =>
                                        white.withOpacity(0.1)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(50.0),
                                    ))),
                            onPressed: (){},
                            child: Icon(Icons.grid_view_outlined,color: white.withOpacity(0.5),),
                          ),
                          CircleAvatar(
                            backgroundColor: white.withOpacity(0.4),
                            radius: 16,
                          )
                        ],
                      ),
                    ),


                  ],
                ),
              ),

              NoteSectionAll(),
              NotesListSection()
            ],
          ),
        ),
      ),
    );
  }

  Widget NoteSectionAll(){
    return Container(
      // color: Colors.deepPurple,
      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25,vertical: 8),
            child: Row(
              children: [
                Text("All",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: white.withOpacity(0.5)
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: MasonryGridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              crossAxisCount: 2,
              itemCount: 10,
              // semanticChildCount: 2,


              itemBuilder: (context, index) =>
                // return Tile(
                //   index: index,
                //   extent: (index % 5 + 1) * 100,
                // );
                InkWell(
                  onTap: ()
                  {
                   Navigator.push(context, MaterialPageRoute(
                       builder: (context) => NoteView(note: notesList[index])));
                  },
                  child:
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: white.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(7)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("HEADING",
                            style: TextStyle(
                                color: white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          index.isEven
                              ? note.length > 250
                              ? "${note.substring(0, 250)}..."
                              : note
                              : note1,
                          style: TextStyle(color: white),
                        )
                      ],
                    ),
                  ),
                ),
            ),
          ),
        ],
      )
    );
  }


  Widget NotesListSection() {
    return Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "LIST VIEW",
                    style: TextStyle(
                        color: white.withOpacity(0.5),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: white.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(7)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("HEADING",
                            style: TextStyle(
                                color: white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          index.isEven
                              ? note.length > 250
                              ? "${note.substring(0, 250)}..."
                              : note
                              : note1,
                          style: TextStyle(color: white),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ));
  }
}
