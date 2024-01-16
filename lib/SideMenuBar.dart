import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goole_notes/ArchiveView.dart';
import 'package:goole_notes/Setting.dart';
import 'package:goole_notes/colors.dart';

class SideMenuBar extends StatefulWidget {
  const SideMenuBar({super.key});

  @override
  State<SideMenuBar> createState() => _SideMenuBarState();
}

class _SideMenuBarState extends State<SideMenuBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero, // Set border radius to zero
      ),
      child:Container(
        color: bgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
              child: Text("Google Note",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                fontSize: 25,
                color: white,
              ),),
            ),

            Divider(
              color: white.withOpacity(0.5),
              height: 0.3,
            ),

            SizedBox(height: 5,),
            SectionNote(),
            SizedBox(height: 5,),
            SectionArchive(),
            SizedBox(height: 5,),
            SectionSetting(),
          ],
        ),
      ),
    );
  }

  Widget SectionNote(){
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orangeAccent.withOpacity(0.3)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                bottomRight: Radius.circular(50)
              ),
            )
          ),
        ),
        onPressed: (){},
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(Icons.lightbulb,
              color: white.withOpacity(0.7),
                size: 25,
              ),
              SizedBox(width: 27,),
              Text("Notes",
              style: TextStyle(
                fontSize: 18,
                color: white.withOpacity(0.7),
              ),)
            ],
          ),
        ),
      ),
    );
  }

  Widget SectionArchive(){
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ArchiveView()));
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orangeAccent.withOpacity(0.3)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
        bottomRight: Radius.circular(50),
        )
        )),
        ),
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(Icons.archive_outlined,
              color: white.withOpacity(0.7),
              size: 25,
              ),
              SizedBox(width: 27,),
              Text("Archive",
              style: TextStyle(
                color: white.withOpacity(0.7),
                fontSize: 18,
                // fontWeight: FontWeight.w600
              ),)
            ],
          ),
        ),
      ),
    );
  }
  
  Widget SectionSetting(){
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: TextButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage()));
      },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orangeAccent.withOpacity(0.3),),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )
              )
            )
          ),
          child: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Icon(Icons.settings_outlined,
                color: white.withOpacity(0.7),
                size: 25,
                ),
                SizedBox(width: 27,),
                Text("Setting",
                style: TextStyle(
                  fontSize: 18,
                  color: white.withOpacity(0.7),
                ),)
              ],
            ),
          )),
    );
  }
}
