import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:goole_notes/SearchPage.dart';
import 'package:goole_notes/SideMenuBar.dart';
import 'package:goole_notes/colors.dart';

import 'CreateNoteView.dart';
import 'MyNotesModel.dart';
import 'NoteView.dart';

// ArchiveView({Key? key}) : super(key: key);
///  this line is defining a constructor for a widget named ArchiveView in Flutter.
///  The constructor takes an optional named parameter key of type Key?, and
///  it passes this key parameter to the constructor of the superclass using
///  the super keyword. The Key class is commonly used in Flutter to uniquely identify widgets,
///  especially when they are used in lists or other situations where
///  Flutter needs to distinguish between different instances of the same widget type.

class ArchiveView extends StatefulWidget {
  const ArchiveView({super.key});

  @override
  State<ArchiveView> createState() => _ArchiveViewState();
}

class _ArchiveViewState extends State<ArchiveView> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  String note =
      "THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE";
  String note1 = "THIS IS NOTE THIS IS NOTE THIS IS NOTE";

  IconData currentIcon = Icons.grid_view_outlined;

  late List<Note> notesList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => CreateNoteView()) );
          },
          backgroundColor: cardColor,
          child: Icon(Icons.add , size: 45,),
        ),
        endDrawerEnableOpenDragGesture: true,
        key: _drawerKey,
        drawer: SideMenuBar(),
        backgroundColor: bgColor,
        body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  color: black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 3)
                            ]),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        _drawerKey.currentState!.openDrawer();
                                      },
                                      icon: Icon(
                                        Icons.menu,
                                        color: white,
                                      )),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Container(
                                      height: 55,
                                      width: 200,
                                      child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Search Your Notes",
                                              style: TextStyle(
                                                  color: white.withOpacity(0.5),
                                                  fontSize: 16),
                                            )
                                          ]))
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
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
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.grid_view,
                                          color: white,
                                        )),
                                    SizedBox(
                                      width: 9,
                                    ),
                                    CircleAvatar(
                                      radius: 16,
                                      backgroundColor: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ])),
                    NoteSectionAll(),
                    NotesListSection()
                  ],
                ),
              ),
            )));
  }

  Widget NoteSectionAll() {
    return Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "ALL",
                    style: TextStyle(
                        color: white.withOpacity(0.5),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Container(
            //     padding: EdgeInsets.symmetric(
            //       horizontal: 10,
            //       vertical: 15,
            //     ),
            //     child: StaggeredGridView.countBuilder(
            //         physics: NeverScrollableScrollPhysics(),
            //         shrinkWrap: true,
            //         itemCount: 10,
            //         mainAxisSpacing: 12,
            //         crossAxisSpacing: 12,
            //         crossAxisCount: 4,
            //         staggeredTileBuilder: (index) => StaggeredTile.fit(2),
            //         itemBuilder: (context, index) =>
            //             InkWell(
            //               onTap: ()
            //               {
            //                 // Navigator.push(context, MaterialPageRoute(builder: (context) => NoteView(note: note,)));
            //               },
            //               child:
            //               Container(
            //                 padding: EdgeInsets.all(10),
            //                 decoration: BoxDecoration(
            //                     border: Border.all(color: white.withOpacity(0.4)),
            //                     borderRadius: BorderRadius.circular(7)),
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text("HEADING",
            //                         style: TextStyle(
            //                             color: white,
            //                             fontSize: 20,
            //                             fontWeight: FontWeight.bold)),
            //                     SizedBox(
            //                       height: 10,
            //                     ),
            //                     Text(
            //                       index.isEven
            //                           ? note.length > 250
            //                           ? "${note.substring(0, 250)}..."
            //                           : note
            //                           : note1,
            //                       style: TextStyle(color: white),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //
            //             )
            //     )),

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
        ));
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







//     return Scaffold(
//       backgroundColor: bgColor,
//       key: _drawerKey,
//       drawer: SideMenuBar(),
//       endDrawerEnableOpenDragGesture: true,
//       body: Container(
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     child: Row(
//                       children: [
//                         IconButton(
//                             onPressed: (){
//                               _drawerKey.currentState?.openDrawer();
//                             }, icon: Icon(Icons.menu),
//                         ),
//                         SizedBox(width: 27,),
//                         Text("Archive",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                             color: white.withOpacity(0.3),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   Container(
//                     child: Row(
//                       children: [
//                         IconButton(
//                             onPressed: (){
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
//                             }, icon: Icon(Icons.search)),
//                         IconButton(
//                             onPressed: (){
//                               setState(() {
//                                 currentIcon = (currentIcon == Icons.grid_view_outlined)
//                                     ?Icons.list
//                                     :Icons.grid_view_outlined;
//                               });
//                             },
//                             icon: Icon(currentIcon),
//                         ),
//                         // Icon(Icons.list_outlined)
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
