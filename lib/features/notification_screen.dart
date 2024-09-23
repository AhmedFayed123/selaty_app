import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:task1/features/home_screen/presentation/home_view.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification Screen',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message.notification!.title.toString(),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              message.notification!.body.toString(),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              message.data.toString(),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomeView()));
                },
                child: const Text('go to selaty'))
          ],
        ),
      ),
    );
  }
}
