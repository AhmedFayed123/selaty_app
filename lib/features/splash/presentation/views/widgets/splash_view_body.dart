import 'package:flutter/material.dart';
import 'package:task1/features/onboarding/presentation/views/onboarding.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => OnBoarding(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: 800,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40,),
                Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                ),
                const Text(
                  'سلتي',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Selaty',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    letterSpacing: 3,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const CircularProgressIndicator(
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
