import 'package:flutter/material.dart';
import 'package:task1/features/login/presentation/views/login.dart';
import 'package:task1/utils/custom%20container.dart';

import '../../../../../utils/custom button.dart';
import '../../../../../utils/custom_text_form_field.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'ادخل الاسم';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'ادخل البريد الالكترونى';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'ادخل البريد الالكترونى بشكل صحيح';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'ادخل كلمة المرور';
    }
    if (value.length < 6) {
      return 'يجب ان يحنوى الباسورد على 6 احرف';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration Successful')),
      );
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.archive_outlined,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
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
              )),
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
              const SizedBox(
                height: 40,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _nameController,
                      labelText: 'الاسم',
                      validator: _validateName,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      controller: _emailController,
                      labelText: 'البريد الالكترونى',
                      validator: _validateEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      controller: _passwordController,
                      labelText: 'كلمة المرور',
                      validator: _validatePassword,
                      obscureText: _obscurePassword,
                      suffixIcon: _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      onSuffixIconPressed: _togglePasswordVisibility,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      text: 'اشتراك',
                      fun: _submitForm,
                      color: const Color(0xff16B625),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'او اشترك مع',
                      style: TextStyle(fontSize: 32),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomContainer(
                            icon: Icons.add_circle_outline,
                            text: 'Google',
                            color: Colors.red),
                        SizedBox(
                          width: 15,
                        ),
                        CustomContainer(
                            icon: Icons.add_circle_outline,
                            text: 'Facebook',
                            color: Colors.blue),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
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
