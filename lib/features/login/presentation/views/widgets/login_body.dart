import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/features/change_password/presentation/change_password_view.dart';
import 'package:task1/features/phone_ver/presentation/views/phone_ver_view.dart';
import 'package:task1/features/register/presentation/views/register.dart';
import '../../../../../utils/custom button.dart';
import '../../../../../utils/custom_text_form_field.dart';
import '../../controller/login_controller.dart';
import '../login.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});

  final _formKey = GlobalKey<FormState>();
  final loginController = Get.put(LoginController()); // Initialize the controller

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        padding: const EdgeInsets.all(10),
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
            const SizedBox(height: 40),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: loginController.emailController,
                    labelText: 'البريد الالكترونى',
                    validator: loginController.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  Obx(() => CustomTextFormField(
                    controller: loginController.passwordController,
                    labelText: 'كلمة المرور',
                    validator: loginController.validatePassword,
                    obscureText: loginController.obscurePassword.value,
                    suffixIcon: loginController.obscurePassword.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onSuffixIconPressed: loginController.togglePasswordVisibility,
                  )),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const PhoneVerView());
                        },
                        child: const Text(
                          'هل نسيت كلمة المرور',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: 'تسجيل الدخول',
                    fun: () {
                      loginController.submitForm(_formKey, context);
                    },
                    color: const Color(0xff16B625),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(() => const ChangePasswordView());
                      },
                      child: const Text(
                        'تغيير كلمةالمرور',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ),
                    const Icon(Icons.arrow_right),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => const Register());
                  },
                  child: const Text(
                    'تسجيل؟',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
