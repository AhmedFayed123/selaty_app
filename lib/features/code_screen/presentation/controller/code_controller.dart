import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../change_password/presentation/change_password_view.dart';

class OTPController extends GetxController {
  final List<TextEditingController> otpControllers =
  List.generate(4, (index) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  void submitOtp(BuildContext context) {
    String otp = otpControllers.map((controller) => controller.text).join();
    // Here, you can validate the OTP and handle navigation.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('OTP Entered: $otp')),
    );
    Get.to(const ChangePasswordView());
  }

  @override
  void onClose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.onClose();
  }
}
