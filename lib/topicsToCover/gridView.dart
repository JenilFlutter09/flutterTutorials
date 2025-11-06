import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class GridviewExample extends StatelessWidget {
  const GridviewExample({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final orientation = mediaQuery.orientation;

    return Scaffold(
      appBar:AppBar(
        title: Text(
          'GridView Example',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: CupertinoColors.activeBlue,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),

        //child: countGridView(),
        child: builderGridView(),
        //child: extentGridView(),
        //child: wallpaper(),
      ),
    );
  }
  Widget countGridView(){
    return GridView.count(
        crossAxisCount: 3,
        children: List.generate(10, (index) {
          return Container(

            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: getRandomColor()
            ),
            child: Center(
              child: Text(
                'Item $index',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          );
        },
        ));
  }

  Widget builderGridView(){
    final items = ['Bahubali', 'Don', 'War 2', 'Krish', 'Golmaal','HeraPheri'];
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // number of items in each row
        mainAxisSpacing: 8.0, // spacing between rows
        crossAxisSpacing: 8.0, // spacing between columns
      ),
      padding: EdgeInsets.all(8.0), // padding around the grid
      itemCount: items.length, // total number of items
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue, // color of grid items
          child: Center(
            child: Text(
              items[index],
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  Widget wallpaper(){
    final wallpapers = List.generate(
      15,
          (index) => 'https://picsum.photos/id/${index + 20}/500/800',
    );

    return GridView.builder(
      itemCount: wallpapers.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // two columns
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.7, // base ratio (height = 1.4x width)
      ),
      itemBuilder: (context, index) {
        // Randomize heights to simulate staggered layout
        final isLarge = index.isEven;
        final double height = isLarge ? 300 : 180;

        return SizedBox(
          height: height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              wallpapers[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget extentGridView(){
    final items = ['Bahubali', 'Don', 'War 2', 'Krish', 'Golmaal','HeraPheri'];
    return GridView.extent(
      maxCrossAxisExtent: 200.0, // maximum item width
      mainAxisSpacing: 8.0, // spacing between rows
      crossAxisSpacing: 8.0, // spacing between columns
      padding: EdgeInsets.all(8.0), // padding around the grid
      children: items.map((item) {
        return Container(
          color: Colors.blue, // color of grid items
          child: Center(
            child: Text(
              item,
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        );
      }).toList(),
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

class WallpaperGridManual extends StatelessWidget {
  const WallpaperGridManual({super.key});

  @override
  Widget build(BuildContext context) {
    final wallpapers = List.generate(
      15,
          (index) => 'https://picsum.photos/id/${index + 20}/500/800',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wallpaper Grid",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: wallpapers.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // two columns
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.7, // base ratio (height = 1.4x width)
          ),
          itemBuilder: (context, index) {
            // Randomize heights to simulate staggered layout
            final isLarge = index.isEven;
            final double height = isLarge ? 300 : 180;

            return SizedBox(
              height: height,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  wallpapers[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
