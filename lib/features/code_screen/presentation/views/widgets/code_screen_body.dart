import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/utils/custom%20button.dart';

import '../../controller/code_controller.dart';

class OTPView extends StatelessWidget {
  const OTPView({super.key});

  @override
  Widget build(BuildContext context) {
    final OTPController controller = Get.put(OTPController());

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'ادخل رمز OTP الخاص بك هنا',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Form(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) => _buildOtpInput(controller, index)),
                  ),
                  const SizedBox(height: 50),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'لم يصل الكود؟',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle resend code logic
                          },
                          child: const Text(
                            'اعادةارسال رمز جديد',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: 'تأكيد',
                    fun: () {
                      controller.submitOtp(context);
                    },
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpInput(OTPController controller, int index) {
    return Container(
      width: 70,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: TextFormField(
        controller: controller.otpControllers[index],
        focusNode: controller.focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            controller.focusNodes[index + 1].requestFocus();
          }
          if (value.isEmpty && index > 0) {
            controller.focusNodes[index - 1].requestFocus();
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          }
          return null;
        },
      ),
    );
  }
}
