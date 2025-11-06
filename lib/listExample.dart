import 'package:flutter/material.dart';

class listExample extends StatelessWidget {
  const listExample({super.key});

  @override
  Widget build(BuildContext context) {
    var friendsName = [
      'jenil',
      'vatsal',
      'harsh',
      'jenil',
      'vatsal',
      'harsh',
      'jenil',
      'vatsal',
      'harsh',
    ];
    return Scaffold(
      appBar: AppBar(title: Text('GridViewExample'), centerTitle: true),
      body: Container(
      /*  child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: friendsName.length,
          itemBuilder: (context, index) {
            var data = friendsName[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text(
                  data,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),*/
      ),
    );
  }
}
