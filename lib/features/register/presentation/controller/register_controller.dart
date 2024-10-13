import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/auth_service.dart';
import '../../../login/presentation/views/login.dart';
import '../models/register_model.dart';


class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var obscurePassword = true.obs;
  var isLoading = false.obs;

  @override
  void onClose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'ادخل الاسم';
    }
    return null;
  }

  String? validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'ادخل رقم الهاتف';
    }
    return null;
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

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'تأكيد كلمة المرور مطلوب';
    }
    if (value != passwordController.text) {
      return 'كلمات المرور غير متطابقة';
    }
    return null;
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> submitForm(GlobalKey<FormState> formKey, BuildContext context) async {
    if (formKey.currentState?.validate() == true) {
      if (passwordController.text != confirmPasswordController.text) {
        Get.snackbar('خطأ', 'كلمات المرور غير متطابقة');
        return; // إيقاف التنفيذ إذا كانت كلمات المرور غير متطابقة
      }
      isLoading(true);
      try {
        // إنشاء نموذج التسجيل
        RegisterModel registerModel = RegisterModel(
          name: nameController.text,
          mobile: mobileController.text,
          email: emailController.text,
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
          profilePhotoPath: '', // يمكنك هنا تحديد مسار الصورة إذا كان موجوداً
          onesignalId: 'some_onesignal_id', // أضف الـ OneSignal ID هنا
        );

        // استدعاء API للتسجيل
        final response = await RegisterApiService().registerUser(registerModel);

        // إذا تم التسجيل بنجاح، الانتقال إلى صفحة تسجيل الدخول
        Get.snackbar('نجاح', 'تم التسجيل بنجاح');
        Get.to(() => const Login()); // التنقل إلى صفحة تسجيل الدخول بعد النجاح
      } catch (error) {
        Get.snackbar('خطأ', 'فشل التسجيل: ${error.toString()}');
      } finally {
        isLoading(false);
      }
    }
  }
}
