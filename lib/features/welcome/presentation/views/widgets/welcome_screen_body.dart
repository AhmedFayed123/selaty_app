import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/custom button.dart';
import '../../controller/welcome_controller.dart';

class WelcomeScreenBody extends StatelessWidget {
  WelcomeScreenBody({super.key});

  // هنا نقوم بربط الـ Controller مع الـ View
  final WelcomeController controller = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 120,
                ),
                const Column(
                  children: [
                    Text(
                      'سلتي',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Selaty',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              text: 'تسجيل الدخول',
              fun: () {
                controller.goToLogin();
              },
              color: const Color(0xffB91B2E),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'انشاء حساب',
              fun: () {
                controller.goToRegister();
              },
              color: const Color(0xff16B625),
            ),
          ],
        ),
      ),
    );
  }
}
