import 'package:flutter/material.dart';
import 'package:task1/features/shopping_cart/presentation/address_screen/address_screen.dart';
import 'package:task1/features/shopping_cart/presentation/shopping_screen/widgets/shopping_list.dart';
import 'package:task1/features/shopping_cart/presentation/shopping_screen/widgets/shopping_main_container.dart';
import 'package:task1/utils/custom%20button.dart';
import 'package:task1/utils/custom_app_bar.dart';

class ShoppingScreenBody extends StatelessWidget {
  const ShoppingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: MediaQuery.of(context).size.width < 700
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              child: Column(
                children: [
                  const CustomAppBar(text: 'عربة التسوق'),
                  const SizedBox(
                    height: 15,
                  ),
                  const ShoppingList(),
                  const SizedBox(
                    height: 15,
                  ),
                  const ShoppingMainContainer(),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    text: 'الدفع',
                    fun: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const AddressScreen()),
                      );
                    },
                    color: Colors.green,
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              child: Column(
                children: [
                  const CustomAppBar(text: 'عربة التسوق'),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40,),
                          const ShoppingMainContainer(),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 250,
                            child: CustomButton(
                              text: 'الدفع',
                              fun: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddressScreen()),
                                );
                              },
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const SizedBox(
                        height: 350,
                        child: ShoppingList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
