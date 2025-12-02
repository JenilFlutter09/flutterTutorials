import 'package:flutter/material.dart';
import 'package:fluttertutorials/topicsToCover/navigation.dart';
import 'package:fluttertutorials/topicsToCover/signup.dart';
import 'package:get/get.dart';

import 'homeScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
      routes: {
        '/setStateExample': (context) => const setStateExample(),
        '/Password': (context) => SignIn(),
      },
    );
  }
}
