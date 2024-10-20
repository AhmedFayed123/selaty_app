import 'package:flutter/material.dart';
import 'package:task1/features/shopping_cart/presentation/shopping_cart_screen/widgets/shopping_cart_screen_body.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ShoppingCartScreenBody(),
    );
  }
}
