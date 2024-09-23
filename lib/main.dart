import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:task1/features/splash/presentation/views/splash_view.dart';
import 'features/notification_screen.dart';


//fe3a5785-0220-46af-a193-9244bf484dad
final navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.shared.setAppId('fe3a5785-0220-46af-a193-9244bf484dad');

  // Set Notification Will Show In Foreground Handler
  OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
    // Display the notification
    event.complete(event.notification);
  });

  // Set Notification Opened Handler
  OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    // Access notification data
    final notification = result.notification;
    final message = notification.body ?? 'No message available';

    // Show a pop-up at the top of the screen
    showSimpleNotification(
      Text(message),
      background: Colors.blue,
      duration: const Duration(seconds: 3),
    );
  });
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyD9UT37goZOCTkvjXim48V454lox65z5RM', // Replace with your actual API key
        appId: '1:559417091223:android:9f939194661fc0012975d2', // Replace with your actual app ID
        messagingSenderId: '559417091223', // Replace with your actual sender ID
        projectId: 'selaty-99e3e', // Replace with your actual project ID
        storageBucket: 'selaty-99e3e.appspot.com', // Replace with your actual storage bucket
      )
  );
  // await FirebaseApi().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFECEFF2),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Color(0xFFECEFF2),
        ),
      ),
      home: const SplashView(),
      routes: {
        '/notification_screen':(context)=>const NotificationScreen(),
      },
    );
  }
}
