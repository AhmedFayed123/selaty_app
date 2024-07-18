import 'package:flutter/material.dart';
import 'package:task1/features/shopping_cart/presentation/success_screen/widgets/success_screen_body.dart';
import 'package:task1/utils/custom_bottom_nav_bar.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SuccessScreenBody(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
