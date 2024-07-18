import 'package:flutter/material.dart';
import 'package:task1/features/shopping_cart/presentation/success_screen/widgets/success_main_container.dart';
import 'package:task1/utils/custom_app_bar.dart';

class SuccessScreenBody extends StatelessWidget {
  const SuccessScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          children: [
            CustomAppBar(text: 'طلب ناجح'),
            SizedBox(height: 30,),
            SuccessMainContainer(),
          ],
        ),
      ),
    );
  }
}
