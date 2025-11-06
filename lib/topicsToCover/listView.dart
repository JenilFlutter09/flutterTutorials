import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ListviewExample extends StatelessWidget {
  const ListviewExample({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final orientation = mediaQuery.orientation;
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'ListView Example',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: CupertinoColors.activeBlue,
        centerTitle: true,
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context,index){
              return Container(
                height: 100,
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:  getRandomColor(),
                ),
                child: Text('List Item Count = $index', style: TextStyle(color: Colors.white,fontSize: 30),),
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
