import 'package:flutter/material.dart';
import 'package:task1/features/shopping_cart/presentation/shopping_screen/shopping_screen.dart';
import 'package:task1/utils/custom%20button.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          Center(
            child: Image.asset(
              'assets/images/bag_icon.png',
              color: Colors.red,
              height: 150,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'عربة التسوق فارغة!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'اجعل سلتك جميلة واضف بعض المنتجات',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomButton(
              text: 'ابدأ التسوق',
              fun: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ShoppingScreen(),
                  ),
                );
              },
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
