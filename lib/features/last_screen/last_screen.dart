import 'package:flutter/material.dart';
import 'package:task1/features/login/presentation/views/login.dart';

class LastScreen extends StatelessWidget {
  const LastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height+120,
              color: Colors.green,
              width: double.infinity,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(300),
                    border: Border.all(color: Colors.white)),
                child: Image.asset(
                  'assets/images/key.png',
                  cacheHeight: 180,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                'كلمة المرور الخاصة بك لها',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                width: 270,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>const Login()),
                    );
                  },
                  child: const Text(
                    'تم',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w400,
                        fontSize: 32),
                  ),
                ),
              ),
            ],
                    ),
                  ),
          )),
    );
  }
}
