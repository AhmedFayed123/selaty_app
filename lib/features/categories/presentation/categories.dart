import 'package:flutter/material.dart';
import 'package:task1/features/categories/presentation/widgets/categories_body.dart';
import 'package:task1/utils/custom_bottom_nav_bar.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CategoriesBody(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
