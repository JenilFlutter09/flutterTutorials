import 'package:flutter/material.dart';
class navigateOne extends StatelessWidget {
  const navigateOne({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    TextEditingController data = TextEditingController();
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: data,),
            Center(
              child: ElevatedButton(onPressed: (){
                String name = data.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => navigateTwo(dataName: name)),
                );
              }, child: Text('Next Screen')),
            ),
          ],
        ),
      ),
    );
  }
}
class navigateTwo extends StatelessWidget {
  const navigateTwo({super.key,required this.dataName});
  final dataName;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return  Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(dataName)
          ],
        ),
      ),
    );
  }
}

