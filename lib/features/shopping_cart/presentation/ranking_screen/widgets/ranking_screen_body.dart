import 'package:flutter/material.dart';
import 'package:task1/features/shopping_cart/presentation/ranking_screen/widgets/ranking_stepper.dart';
import 'package:task1/features/shopping_cart/presentation/ranking_screen/widgets/top_container.dart';
import 'package:task1/utils/custom_app_bar.dart';

class RankingScreenBody extends StatelessWidget {
  const RankingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          children: [
            const CustomAppBar(text: 'ترتيب المسار'),
            const SizedBox(height: 20,),
            const TopContainer(),
            const SizedBox(height: 20,),
            RankingStepper(),
          ],
        ),
      ),
    );
  }
}
