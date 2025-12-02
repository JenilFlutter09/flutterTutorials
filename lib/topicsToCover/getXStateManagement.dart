import 'package:flutter/material.dart';
import 'package:fluttertutorials/topicsToCover/signup.dart';
import 'package:get/get.dart';

/// UI Class
class getExample extends StatelessWidget {
  getExample({super.key});
  // getExampleController controller = Get.put(getExampleController());
  String name = "jenil";
  var nameTwo = "jenil".obs;
  RxInt count = 1.obs;
  var rxCount = 1.obs;
  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Scaffold(
      appBar: AppBar(title: Text('To Do Application')),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(/*controller.*/name, style: TextStyle(fontSize: 30)),
            Text(/*controller.*/nameTwo.value, style: TextStyle(fontSize: 30)),
            Obx(() {
              return Text(
                /*controller.*/count.toString(),
                style: TextStyle(fontSize: 30),
              );
            }),
           Text(/*controller.*/count.toString(), style: TextStyle(fontSize: 30)),
            Obx(() {
              return Text(
                /*controller.*/rxCount.value.toString(),
                style: TextStyle(fontSize: 30),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => /*controller.*/addCounter(),
        child: Icon(Icons.add_circle),
      ),
    );
  }
  void addCounter() {
    count++;
    rxCount.value++;
  }
}

// class getExampleController extends GetxController {
//   String name = "jenil";
//   var nameTwo = "jenil".obs;
//   RxInt count = 1.obs;
//   var rxCount = 1.obs;
//
//   void addCounter() {
//     count++;
//     rxCount.value++;
//   }
// }
