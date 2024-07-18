import 'package:flutter/material.dart';
import 'package:task1/features/welcome/presentation/views/widgets/welcome_screen_body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: const WelcomeScreenBody(),
      ),
    );
  }
}
