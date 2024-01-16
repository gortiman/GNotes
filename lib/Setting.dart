import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goole_notes/colors.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool value = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.white, // Change the color of the back arrow
        ),
        title: Text("Settings",
        style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text("Sync",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: white.withOpacity(0.7),
                ),),
                Spacer(),
                Transform.scale(
                  scale: 0.6,
                  child: Switch(value: value, onChanged: (switchValue){
                    setState(() {
                      this.value = switchValue;
                    });
                  }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
