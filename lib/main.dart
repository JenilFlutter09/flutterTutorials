import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertutorials/firebase/firebaseNotificatoin.dart';
import 'package:fluttertutorials/topicsToCover/navigation.dart';
import 'package:fluttertutorials/topicsToCover/signup.dart';
import 'package:get/get.dart';

import 'firebase/notification.dart';
import 'firebase_options.dart';
import 'homeScreen.dart';

@pragma('vm:entry-point')
Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);

  await Get.putAsync(() => NotifyService().init());
  final token = await Get.find<NotifyService>().getToken();
  print("🔥 FCM TOKEN: $token");
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
