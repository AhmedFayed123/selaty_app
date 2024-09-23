import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/features/login/presentation/views/login.dart';
import '../../../../../utils/custom button.dart';
import '../../../../../utils/custom container.dart';
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
              onPressed: () {},
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
                      suffixIcon: registerController.obscurePassword.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      onSuffixIconPressed: registerController.togglePasswordVisibility,
                    )),
                    const SizedBox(height: 30),
                    CustomButton(
                      text: 'اشتراك',
                      fun: () {
                        registerController.submitForm(formKey, context);
                      },
                      color: const Color(0xff16B625),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'او اشترك مع',
                      style: TextStyle(fontSize: 32),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomContainer(
                          icon: Icons.add_circle_outline,
                          text: 'Google',
                          color: Colors.red,
                        ),
                        SizedBox(width: 15),
                        CustomContainer(
                          icon: Icons.add_circle_outline,
                          text: 'Facebook',
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Login()));
                              },
                              child: const Text(
                                'تسجيل الدخول',
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Login()));
                          },
                          child: const Text(
                            'لديك حساب بالفعل؟',
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
            ],
          ),
        ),
      ),
    );
  }
}
