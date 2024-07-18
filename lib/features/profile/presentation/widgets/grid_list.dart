import 'package:flutter/material.dart';

class ProfileGridList extends StatelessWidget {
  const ProfileGridList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1 / 1,
      ),
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 9,
      itemBuilder: (BuildContext context, int index) => const ListItem(),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.person,
            color: Colors.red,
            size: 30,
          ),
          Text(
            'عنى',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          )
        ],
      ),
    );
  }
}
