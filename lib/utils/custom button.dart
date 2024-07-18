import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.fun, required this.color});

  final String text;
  final Function() fun;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 65,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: fun,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 25
          ),
        ),
      ),
    );
  }
}
