import 'package:flutter/material.dart';
import 'package:task1/features/last_screen/last_screen.dart';

import '../../../../utils/custom button.dart';

class ChangePasswordBody extends StatefulWidget {
  const ChangePasswordBody({super.key});

  @override
  State<ChangePasswordBody> createState() => _ChangePasswordBodyState();
}

class _ChangePasswordBodyState extends State<ChangePasswordBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'ادخل كلمة المرور';
    }
    if (value.length < 6) {
      return 'يجب ان تحتوى كلمة المرور على 6 احرف';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value != _newPasswordController.text) {
      return 'كلمة المرور غير متطابقة';
    }
    return null;
  }

  void _togglePasswordVisibility(TextEditingController controller) {
    setState(() {
      if (controller == _newPasswordController) {
        _obscureNewPassword = !_obscureNewPassword;
      } else if (controller == _confirmPasswordController) {
        _obscureConfirmPassword = !_obscureConfirmPassword;
      }
    });
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password Changed Successfully')),
      );
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LastScreen(),),);
    }
  }
  Widget _buildPasswordField(TextEditingController controller, String labelText, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
            onPressed: () => _togglePasswordVisibility(controller),
          ),
        ),
        obscureText: obscureText,
        validator: controller == _confirmPasswordController ? _validateConfirmPassword : _validatePassword,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              'ادخل كلمة المرور الجديدة',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Form(
              key: _formKey,
              child: Column(
                children:[
                  _buildPasswordField(_newPasswordController, 'كلمة المرور الجديدة', _obscureNewPassword),
                  _buildPasswordField(_confirmPasswordController, 'تأكيد كلمة المرور', _obscureConfirmPassword),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: 'تغير',
                    fun: _submitForm,
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
}
