import 'package:flutter/material.dart';
import 'package:task1/features/phone_ver/presentation/views/widgets/phone_ver_view_body.dart';

class PhoneVerView extends StatelessWidget {
  const PhoneVerView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'تحقق من رقم الهاتف',
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
        body: const PhoneVerViewBody(),
      ),
    );
  }
}
