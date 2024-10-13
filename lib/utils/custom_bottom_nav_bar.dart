import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/features/favorite/presentation/view/favorite_view.dart';

import '../features/add_to_card/presentation/saved_products_screen.dart';
import '../features/products/presentation/view/product_view.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // التنقل بين الصفحات باستخدام Navigator
    switch (index) {
      case 0:
        Get.to(() => const ProductView());
        break;
      case 1:
        Get.to(() => const FavoriteView());
        break;
      case 2:
        Navigator.pushNamed(context, '/home');
        break;
      case 3:
        Get.to(() => const SavedProductsScreen());
        break;
      case 4:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 5,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      // العنصر المختار
      fixedColor: const Color(0xff2398C3),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: _onItemTapped,
      // استدعاء التنقل عند الضغط على عنصر
      items: [
        const BottomNavigationBarItem(
          label: 'Products',
          icon: Icon(
            Icons.production_quantity_limits,
          ),
        ),
        const BottomNavigationBarItem(
          label: 'Favourite',
          icon: Icon(
            Icons.favorite_border_outlined,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Home',
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
          label: 'card',
          icon: Icon(Icons.archive_outlined),
        ),
        const BottomNavigationBarItem(
          label: 'Person',
          icon: Icon(Icons.perm_identity_outlined),
        ),
      ],
    );
  }
}
