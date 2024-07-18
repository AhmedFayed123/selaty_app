import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.onSuffixIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: onSuffixIconPressed,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(),
        ),
      ),
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }
}
