import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task1/features/change_password/presentation/change_password_view.dart';
import 'package:task1/utils/custom%20button.dart';

class CodeScreenBody extends StatefulWidget {
  const CodeScreenBody({super.key});

  @override
  State<CodeScreenBody> createState() => _CodeScreenBodyState();
}

class _CodeScreenBodyState extends State<CodeScreenBody> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _otpControllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _submitOtp() {
    if (_formKey.currentState?.validate() == true) {
      String otp = _otpControllers.map((controller) => controller.text).join();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP Entered: $otp')),
      );
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ChangePasswordView(),
        ),
      );
    }
  }

  Widget _buildOtpInput(int index) {
    return Container(
      width: 70,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: TextFormField(
        controller: _otpControllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            _focusNodes[index + 1].requestFocus();
          }
          if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
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

  @override
  Widget build(BuildContext context) {
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
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        List.generate(4, (index) => _buildOtpInput(index)),
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
                          onTap: () {},
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
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    text: 'تأكيد',
                    fun: () {
                      _submitOtp();
                    },
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
