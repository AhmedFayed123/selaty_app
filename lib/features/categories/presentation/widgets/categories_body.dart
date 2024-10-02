import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/custom_app_bar.dart';
import 'categories_list.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
        child: Column(
          children: [
            const CustomAppBar(
              text: 'التصنيفات',
            ),
            SizedBox(
              width: 500,
              child: CategoriesList(),
            ),
          ],
        ),
      ),
    );
  }
}
