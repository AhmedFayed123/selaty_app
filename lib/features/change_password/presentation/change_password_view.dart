import 'package:flutter/material.dart';
import 'package:task1/features/change_password/presentation/widgets/change_password_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.center,
            child: Text(
              'تغيير كلمة المرور',
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
        body: const ChangePasswordBody(),
      ),
    );
  }
}
