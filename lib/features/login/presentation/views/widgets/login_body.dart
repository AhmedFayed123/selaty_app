import 'package:flutter/material.dart';
import 'package:task1/features/home_screen/presentation/home_view.dart';
import 'package:task1/features/phone_ver/presentation/views/phone_ver_view.dart';
import '../../../../../utils/custom button.dart';
import '../../../../../utils/custom_text_form_field.dart';
import '../login.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
      return 'يجب انا تحتوى كلمة المرور على 6 احرف';
    }
    return null;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() == true) {
      // Perform login logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Successful')),
      );
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
      );
    }
  }

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
                    controller: _emailController,
                    labelText: 'البريد الالكترونى',
                    validator: _validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: _passwordController,
                    labelText: 'كلمة المرور',
                    validator: _validatePassword,
                    obscureText: _obscurePassword,
                    suffixIcon: _obscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onSuffixIconPressed: _togglePasswordVisibility,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const PhoneVerView(),
                            ),
                          );
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
                    fun: _submitForm,
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Login()));
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
    );
  }
}
