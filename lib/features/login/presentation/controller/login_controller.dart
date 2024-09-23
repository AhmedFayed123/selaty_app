import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/features/home_screen/presentation/home_view.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var obscurePassword = true.obs; // to handle password visibility

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'ادخل البريد الالكترونى';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'ادخل البريد الالكترونى بشكل صحيح';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'ادخل كلمة المرور';
    }
    if (value.length < 6) {
      return 'يجب أن تحتوي كلمة المرور على 6 أحرف على الأقل';
    }
    return null;
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void submitForm(GlobalKey<FormState> formKey, BuildContext context) {
    if (formKey.currentState?.validate() == true) {
      // Perform login logic
      Get.snackbar('Success', 'Login Successful');
      Get.to(() => const HomeView());
    }
  }
}
