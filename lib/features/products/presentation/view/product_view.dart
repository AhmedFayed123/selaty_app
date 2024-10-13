import 'package:flutter/material.dart';
import 'package:task1/features/products/presentation/view/widgets/product_list_screen.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: ProductListScreen());
  }
}
