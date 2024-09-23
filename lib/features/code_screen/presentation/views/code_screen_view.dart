import 'package:flutter/material.dart';
import 'package:task1/features/code_screen/presentation/views/widgets/code_screen_body.dart';

class CodeScreenView extends StatelessWidget {
  const CodeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'التحقق من الهاتف',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 25
            ),
          ),
        ),
        actions: [
          Container(
              margin: const EdgeInsets.all(1),
              child: IconButton(
                icon: const Icon(
                  Icons.archive_outlined,
                  size: 20,
                ),
                onPressed: () {},
              )),
        ],
      ),
      body: const OTPView(),
    );
  }
}
