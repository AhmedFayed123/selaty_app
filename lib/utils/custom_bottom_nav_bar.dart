import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 5,
      type: BottomNavigationBarType.fixed,
      fixedColor: const Color(0xff2398C3),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        const BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(
            Icons.search_rounded,
          ),
        ),
        const BottomNavigationBarItem(
          label: 'favourite',
          icon: Icon(
            Icons.favorite_border_outlined,
          ),
        ),
        BottomNavigationBarItem(
          label: 'favourite',
          icon: Container(
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.green),
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
        ),
        const BottomNavigationBarItem(
          label: 'notification',
          icon: Icon(Icons.notifications_none_outlined),
        ),
        const BottomNavigationBarItem(
          label: 'person',
          icon: Icon(Icons.perm_identity_outlined),
        ),
      ],
    );
  }
}
