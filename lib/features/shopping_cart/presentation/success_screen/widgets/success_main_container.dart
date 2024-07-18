import 'package:flutter/material.dart';
import 'package:task1/features/shopping_cart/presentation/ranking_screen/ranking_screen.dart';
import 'package:task1/utils/custom%20button.dart';

class SuccessMainContainer extends StatelessWidget {
  const SuccessMainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/images/success_bag_icon.png',
              width: 250,
            ),
          ),
          const Text(
            '!طلب ناجح',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'شكرا على الطلب - ستحصل عليه',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Text(
            'ودا فى غضون بضع دقائق-',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomButton(
              text: 'ترتيب المسار',
              fun: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RankingScreen(),
                  ),
                );
              },
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
