import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/features/login/presentation/views/login.dart';
import '../../../../../utils/custom button.dart';
import '../../../../../utils/custom_text_form_field.dart';
import '../../controller/register_controller.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final registerController = Get.put(RegisterController()); // Initialize the controller

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(),
          ),
          child: IconButton(
            icon: const Icon(Icons.archive_outlined),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(),
            ),
            child: IconButton(
              icon: const Icon(Icons.add_a_photo_outlined),
              onPressed: () {
                // Add function for picking an image
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'انشاء حساب جديد',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'ادخل بياناتك لانشاء حساب',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
              const SizedBox(height: 40),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: registerController.nameController,
                      labelText: 'الاسم',
                      validator: registerController.validateName,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: registerController.mobileController,
                      labelText: 'رقم الهاتف',
                      validator: registerController.validateMobile,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: registerController.emailController,
                      labelText: 'البريد الالكترونى',
                      validator: registerController.validateEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 10),
                    Obx(() => CustomTextFormField(
                      controller: registerController.passwordController,
                      labelText: 'كلمة المرور',
                      validator: registerController.validatePassword,
                      obscureText: registerController.obscurePassword.value,
                      suffixIcon:
                          registerController.obscurePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                      onSuffixIconPressed: registerController.togglePasswordVisibility,

                    ),
                      ),

                    const SizedBox(height: 10),
                    Obx(() => CustomTextFormField(
                      controller: registerController.confirmPasswordController,
                      labelText: 'تأكيد كلمة المرور',
                      validator: registerController.validateConfirmPassword,
                      obscureText: registerController.obscurePassword.value,
                    )),
                    const SizedBox(height: 40),
                    CustomButton(
                      fun: () {
                        registerController.submitForm(formKey, context);
                        Get.to(const Login());
                      },
                      text: 'تسجيل', color: Colors.green,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
