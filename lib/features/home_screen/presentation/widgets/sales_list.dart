import 'package:flutter/material.dart';

class SalesList extends StatelessWidget {
  const SalesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        itemCount: 11,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const ListItem(),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: 75,
                  color: Colors.white,
                  child: const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'خضروات',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/images/fruits_img.jpg',
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                )
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.orange,
                child: Image.asset(
                  'assets/images/category_icon.png',
                  color: Colors.white,
                  width: 35,
                  height: 35,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
