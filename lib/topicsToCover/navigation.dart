import 'package:flutter/material.dart';

class navigationExample extends StatelessWidget {
  const navigationExample({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Jenil Shah'),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => setStateExample()),
                // );
                Navigator.pushNamed(
                  context,
                  '/setStateExample',
                  arguments: 'Hello from Apeksha!',
                );
              },
              child: Text('Go TO Next Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Pop this page'),
            ),
          ],
        ),
      ),
    );
  }
}



class setStateExample extends StatefulWidget {
  const setStateExample({super.key});

  @override
  State<setStateExample> createState() => _setStateExampleState();
}

class _setStateExampleState extends State<setStateExample> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    String args = ModalRoute.of(context)?.settings.arguments as String;
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Value of data is = $value'),
            ElevatedButton(onPressed: (){

              setState(() {
                value++;
              });
            }, child: Text('Add Me'))
          ],
        ),
      ),
    );
  }
}
