import 'package:flutter/material.dart';

class OfferGridList extends StatelessWidget {
  const OfferGridList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 3,
        childAspectRatio: 1 / 1,
      ),
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) => const ListItem(),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'صفة',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 20
              ),
            ),
            Text(
              '50%',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40
              ),
            ),
            Text(
              'خصم',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontSize: 20
              ),
            ),
          ],
        ),
      ),
    );
  }
}
