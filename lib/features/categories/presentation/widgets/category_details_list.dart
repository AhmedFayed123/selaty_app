import 'package:flutter/material.dart';

import '../../../shopping_cart/presentation/shopping_cart_screen/shopping_cart_screen.dart';

class CategoryDetailsList extends StatelessWidget {
  const CategoryDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 5,
        ),
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => const ListItem(),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ShoppingCartScreen()),
        );
      },
      child: Card.filled(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.greenAccent,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 30,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(16),
                        ),
                        color: Colors.green,
                      ),
                      child: const Center(
                        child: Text(
                          'جديد',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                'assets/images/fruits.png',
                fit: BoxFit.fill,
                cacheWidth: 250,
                cacheHeight: 200, // Replace with your image URL
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.green,
                      ),
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.0),
                          child: Text(
                            'خضروات',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'خضروات',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      '1kg',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFECEFF2),
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(
                              0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16.0, bottom: 4.0),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const Icon(
                              Icons.archive_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 6.0),
                        child: Text(
                          '40 SAR',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
