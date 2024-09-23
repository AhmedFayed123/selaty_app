import 'package:get/get.dart';

import '../../../login/presentation/views/login.dart';
import '../../../register/presentation/views/register.dart';


class WelcomeController extends GetxController {
  // التنقل إلى شاشة تسجيل الدخول
  void goToLogin() {
    Get.to(() => const Login());
  }

  // التنقل إلى شاشة إنشاء الحساب
  void goToRegister() {
    Get.to(() => const Register());
  }
}
