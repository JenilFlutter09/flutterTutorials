import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertutorials/topicsToCover/navigation.dart';
import 'package:fluttertutorials/topicsToCover/stackExample.dart';

import 'listExample.dart';
import 'responsiveness.dart';
import 'topicsToCover/gridView.dart';
import 'topicsToCover/listView.dart';


class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final orientation = mediaQuery.orientation;
    final topics = ['ListView','Gridview', 'tryPage', 'listExample', 'stackExample','Navigation'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Version Up Flutter Tutorials',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: CupertinoColors.activeBlue,
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: topics.length,
            itemBuilder: (context,index){
              final selectedTopic = topics[index];
          return InkWell(
            onTap: (){
              if(index == 0){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListviewExample()),
                );
              }else if(index == 2){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => tryPage()),
                );
              } else if(index == 1){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GridviewExample()),
                );
              }else if(index == 3){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => listExample()),
                );
              }else if(index == 4){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => stackExample()),
                );
              }else if(index == 5){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => navigationExample()),
                );
              }
            },
            child: Container(

              height: 100,
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:  getRandomColor(),
              ),
              child: Text(selectedTopic, style: TextStyle(color: Colors.white,fontSize: 30),),
            ),
          );
        }),
      ),
    );
  }
  Color getRandomColor() {
    final Random _random = Random();
    return Color.fromARGB(
      255, // Alpha (opacity) value, 255 for fully opaque
      _random.nextInt(256), // Red value (0-255)
      _random.nextInt(256), // Green value (0-255)
      _random.nextInt(256), // Blue value (0-255)
    );
  }
}
