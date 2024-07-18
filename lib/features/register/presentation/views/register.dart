import 'package:flutter/material.dart';
import 'package:task1/features/register/presentation/views/widgets/register_body.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: RegisterBody());
  }
}
