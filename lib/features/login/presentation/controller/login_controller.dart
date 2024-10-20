import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../services/auth_service.dart';
import '../../../home_screen/presentation/home_view.dart';


class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var obscurePassword = true.obs;
  var isLoading = false.obs;

  final LoginApiService apiService = LoginApiService();

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> checkLoginStatus() async {
    String? token = await getToken();
    if (token != null && token.isNotEmpty) {

      Get.offAll(() => HomeScreen());
    }
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

  Future<void> submitForm(GlobalKey<FormState> formKey, BuildContext context) async {
    if (formKey.currentState?.validate() == true) {
      isLoading(true);
      try {
        await login();
      } finally {
        isLoading(false);
      }
    }
  }

  Future<void> login() async {
    final phoneEmail = emailController.text;
    final password = passwordController.text;
    const oneSignalId = 'lkfjfkj0450jflfjotij5iufdiueiu433i4ujkdnfd'; // استخدم ID الخاص بك

    try {
      final loginResponse = await apiService.login(phoneEmail, password, oneSignalId);

      if (loginResponse.status) {
        // نجاح تسجيل الدخول
        Get.snackbar('Success', loginResponse.message);

        // تخزين الـ token
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', loginResponse.token ?? '');

        // الانتقال إلى الشاشة الرئيسية
        Get.to(() => HomeScreen());
      } else {
        // فشل تسجيل الدخول
        Get.snackbar('Error', loginResponse.message);
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

}

