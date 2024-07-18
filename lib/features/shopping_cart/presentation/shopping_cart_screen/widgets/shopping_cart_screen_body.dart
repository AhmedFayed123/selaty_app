import 'package:flutter/material.dart';
import 'package:task1/utils/custom_app_bar.dart';

import 'main_container.dart';

class ShoppingCartScreenBody extends StatelessWidget {
  const ShoppingCartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 10),
        child: Column(
          children: [
            CustomAppBar(text: 'عربة التسوق'),
            SizedBox(height: 20,),
            MainContainer(),
          ],
        ),
      ),
    );
  }
}
