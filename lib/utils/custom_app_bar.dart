import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: const Icon(
            Icons.archive_outlined,
            size: 20,
          ),
        ),
        Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
        ),
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
