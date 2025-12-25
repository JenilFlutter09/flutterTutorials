import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotifyService extends GetxService {
  final FirebaseMessaging fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin local =
  FlutterLocalNotificationsPlugin();

  Future<NotifyService> init() async {
    //await requestPermission();
    await initLocalNotification();
    listenForeGroundMessage();
    listenBackground();
    return this;
  }

  /// 🔑 Get FCM Token
  Future<String?> getToken() async {
    var token = await fcm.getToken();
    // print("FCM TOKEN => $token");
    return token;
  }

  // Future<void> requestPermission() async {
  //   await fcm.requestPermission(alert: true, badge: true, sound: true);
  // }
  Future<void> initLocalNotification() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings();

    await local.initialize(
      const InitializationSettings(android: android, iOS: ios),
      //onDidReceiveBackgroundNotificationResponse:(payload){}
    );

  }
  void listenForeGroundMessage(){
    FirebaseMessaging.onMessage.listen((message){
      showLocalNotification(message);
    });
  }
  void listenBackground(){
    FirebaseMessaging.onMessageOpenedApp.listen((message){});
  }

  Future<void> showLocalNotification(RemoteMessage message) async {
    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    const android = AndroidNotificationDetails('default_channel', 'General',
    importance: Importance.high,
      priority: Priority.high
    );
    const ios = DarwinNotificationDetails();
    await local.show(id, message.notification?.title, message.notification?.body, const NotificationDetails(android: android,iOS: ios));
  }
}
