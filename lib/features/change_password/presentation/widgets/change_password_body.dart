import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/custom button.dart';
import '../controller/change_pass_controller.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangePasswordController controller = Get.put(ChangePasswordController());

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            const Text(
              'ادخل كلمة المرور الجديدة',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 50),
            Form(
              child: Column(
                children: [
                  _buildPasswordField(
                      controller.newPasswordController,
                      'كلمة المرور الجديدة',
                      controller.obscureNewPassword,
                      true,
                      controller
                  ),
                  _buildPasswordField(
                      controller.confirmPasswordController,
                      'تأكيد كلمة المرور',
                      controller.obscureConfirmPassword,
                      false,
                      controller
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: 'تغير',
                    fun: () => controller.submitForm(context),
                    color: const Color(0xff16B625),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField(
      TextEditingController controller,
      String labelText,
      RxBool obscureText,
      bool isNewPassword,
      ChangePasswordController passwordController
      ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Obx(() => TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(obscureText.value ? Icons.visibility_off : Icons.visibility),
            onPressed: () => passwordController.togglePasswordVisibility(isNewPassword),
          ),
        ),
        obscureText: obscureText.value,
        validator: isNewPassword ? passwordController.validatePassword : passwordController.validateConfirmPassword,
      )),
    );
  }
}
