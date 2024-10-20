import 'package:flutter/material.dart';
import 'package:task1/features/shopping_cart/presentation/shopping_screen/widgets/shopping_screen_body.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ShoppingScreenBody(),
    );
  }
}
