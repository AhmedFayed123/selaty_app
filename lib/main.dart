import 'package:flutter/material.dart';
import 'package:task1/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      // home: const LastScreen(),
    );
  }
}
