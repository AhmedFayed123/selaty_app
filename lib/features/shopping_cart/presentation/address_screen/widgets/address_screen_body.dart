import 'package:flutter/material.dart';
import 'package:task1/features/shopping_cart/presentation/success_screen/success_screen.dart';
import 'package:task1/utils/custom%20button.dart';
import 'package:task1/utils/custom_app_bar.dart';

import 'address_list.dart';

class AddressScreenBody extends StatelessWidget {
  const AddressScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          children: [
            const CustomAppBar(text: 'عنوان التسليم'),
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'يشحن الى',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            const AddressList(),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'التسليم لهذا العنوان',
              fun: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SuccessScreen(),
                  ),
                );
              },
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
