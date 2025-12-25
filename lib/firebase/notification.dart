import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationService extends GetxService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _local =
  FlutterLocalNotificationsPlugin();

  Future<NotificationService> init() async {
    await _requestPermission();
    await _initLocalNotification();
    _listenForeground();
    _listenBackground();
    _listenTerminated();
    return this;
  }

  /// 🔔 Permission
  Future<void> _requestPermission() async {
    await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  /// 📲 Local notification setup
  Future<void> _initLocalNotification() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings();

    await _local.initialize(
      const InitializationSettings(android: android, iOS: ios),
      onDidReceiveNotificationResponse: (payload) {
        _handleNavigation(payload.payload);
      },
    );
  }

  /// 🟢 Foreground messages
  void _listenForeground() {
    FirebaseMessaging.onMessage.listen((message) {
      _showLocalNotification(message);
    });
  }

  /// 🟠 Background click
  void _listenBackground() {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleNavigation(message.data['route']);
    });
  }

  /// 🔴 Terminated state
  void _listenTerminated() async {
    final message = await _fcm.getInitialMessage();
    if (message != null) {
      _handleNavigation(message.data['route']);
    }
  }

  /// 📢 Show notification
  Future<void> _showLocalNotification(RemoteMessage message) async {
    const android = AndroidNotificationDetails(
      'default_channel',
      'General',
      importance: Importance.high,
      priority: Priority.high,
    );

    await _local.show(
      0,
      message.notification?.title,
      message.notification?.body,
      const NotificationDetails(android: android),
      payload: message.data['route'],
    );
  }

  /// 🧭 Navigation via GetX
  void _handleNavigation(String? route) {
    if (route != null) {
      Get.toNamed(route);
    }
  }

  /// 🔑 Get FCM Token
  Future<String?> getToken() async {
    return await _fcm.getToken();
  }
}


