import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:goole_notes/SearchPage.dart';
import 'package:goole_notes/SideMenuBar.dart';
import 'package:goole_notes/colors.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      key: _drawerKey,
      drawer: SideMenuBar(),
      endDrawerEnableOpenDragGesture: true,
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: (){
                              _drawerKey.currentState?.openDrawer();
                            }, icon: Icon(Icons.menu),
                        ),
                        SizedBox(width: 27,),
                        Text("Archive",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: white.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
                            }, icon: Icon(Icons.search)),
                        IconButton(
                            onPressed: (){
                              setState(() {
                                currentIcon = (currentIcon == Icons.grid_view_outlined)
                                    ?Icons.list
                                    :Icons.grid_view_outlined;
                              });
                            },
                            icon: Icon(currentIcon),
                        ),
                        // Icon(Icons.list_outlined)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
