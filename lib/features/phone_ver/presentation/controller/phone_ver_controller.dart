import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../code_screen/presentation/views/code_screen_view.dart';

class PhoneVerificationController extends GetxController {
  final phoneController = TextEditingController();

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  void proceed(BuildContext context) {
    if (validatePhone(phoneController.text) == null) {
      // Navigate to the next screen
      Get.to(() => const CodeScreenView());
    } else {
      // Show an error message if the form is not valid
      Get.snackbar('Error', 'Please enter a valid phone number');
    }
  }
}
