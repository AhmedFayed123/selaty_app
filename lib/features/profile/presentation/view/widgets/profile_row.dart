import 'package:flutter/material.dart';

class ProfileRow extends StatelessWidget {
  const ProfileRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: ProfileRowItem(
            color1: Colors.red,
            color2: Colors.redAccent,
            title: 'مركز الدعم',
            icon: Icons.support_agent,
          ),
        ),
        SizedBox(width: 15,),
        Expanded(
          child: ProfileRowItem(
            color1: Colors.green,
            color2: Colors.greenAccent,
            title: 'الخروج',
            icon: Icons.output_outlined,
          ),
        )
      ],
    );
  }
}

class ProfileRowItem extends StatelessWidget {
  const ProfileRowItem(
      {super.key,
      required this.color1,
      required this.color2,
      required this.title,
      required this.icon});

  final Color color1;
  final Color color2;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      decoration: BoxDecoration(
        color: color1,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: color2,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w800
              ),
            ),
          ],
        ),
      ),
    );
  }
}
