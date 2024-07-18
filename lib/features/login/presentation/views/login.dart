import 'package:flutter/material.dart';
import 'package:task1/features/login/presentation/views/widgets/login_body.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: const LoginBody(),
      ),
    );
  }
}
