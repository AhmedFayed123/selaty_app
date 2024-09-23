import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../last_screen/last_screen.dart';

class ChangePasswordController extends GetxController {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  var obscureNewPassword = true.obs;
  var obscureConfirmPassword = true.obs;

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'ادخل كلمة المرور';
    }
    if (value.length < 6) {
      return 'يجب ان تحتوى كلمة المرور على 6 احرف';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != newPasswordController.text) {
      return 'كلمة المرور غير متطابقة';
    }
    return null;
  }

  void togglePasswordVisibility(bool isNewPassword) {
    if (isNewPassword) {
      obscureNewPassword.value = !obscureNewPassword.value;
    } else {
      obscureConfirmPassword.value = !obscureConfirmPassword.value;
    }
  }

  void submitForm(BuildContext context) {
    if (newPasswordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        validatePassword(newPasswordController.text) == null &&
        validateConfirmPassword(confirmPasswordController.text) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password Changed Successfully')),
      );
      Get.to(const LastScreen());
    }
  }
}
