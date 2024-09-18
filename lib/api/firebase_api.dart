import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    // Request permission for iOS devices
    await _firebaseMessaging.requestPermission();

    // Get FCM Token
    final fCMToken = await _firebaseMessaging.getToken();
    print('FCM Token: $fCMToken');

    // Initialize push notification listeners
    initPushNotification();
  }

  Future<void> initPushNotification() async {
    // Handle notification when the app is launched from a terminated state
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        _handleMessage(message, fromBackground: true);
      }
    });

    // Handle notification when the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showForegroundNotification(message);
    });

    // Handle notification when the app is in the background but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleMessage(message, fromBackground: true);
    });
  }

  void _showForegroundNotification(RemoteMessage message) {
    final overlay = navigatorKey.currentState!.overlay!;
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50,
        left: MediaQuery.of(context).size.width * 0.1,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue,
          child: ListTile(
            title: Text(
              message.notification?.title ?? 'Notification',
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              message.notification?.body ?? 'You have a new notification.',
              style: const TextStyle(color: Colors.white70),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                overlayEntry?.remove();
              },
            ),
            onTap: () {
              overlayEntry?.remove();
              _handleMessage(message, fromBackground: false);

            },
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 5), () {
      overlayEntry?.remove();
    });
  }

  void _handleMessage(RemoteMessage message, {required bool fromBackground}) {
    navigatorKey.currentState?.pushNamed(
      '/notification_screen',
      arguments: message,
    );
  }
}
