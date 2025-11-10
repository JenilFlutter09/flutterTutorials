import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view/flutter_staggered_grid_view.dart';

class ListviewExample extends StatelessWidget {
  const ListviewExample({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final orientation = mediaQuery.orientation;
    return Scaffold(
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
        /*child: StaggeredGridView.count(
        crossAxisCount: 4,
        staggeredTiles: const [
          StaggeredTile.count(2, 2),
          StaggeredTile.count(1, 2),
          StaggeredTile.count(1, 1),
          StaggeredTile.count(1, 2),
          StaggeredTile.count(2, 1),
          StaggeredTile.count(1, 1),
        ],
        children: List.generate(6, (index) => Card(
          color: Colors.blue.shade100,
          child: Center(child: Text('Item $index')),
        )),
      ),*/
        child: StaggeredGridView.builder(
          gridDelegate: SliverStaggeredGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            staggeredTileBuilder: (index) => StaggeredTile.count(
            (index % 3) + 1, (index % 5) + 1)),
          itemBuilder: (context, index) {
            return Container(color: getRandomColor());
          },
        ),
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
