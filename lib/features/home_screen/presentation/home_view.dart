import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task1/features/home_screen/presentation/widgets/home_body.dart';

import '../../add_to_card/presentation/saved_products_screen.dart';
import '../../favorite/presentation/view/favorite_view.dart';
import '../../products/presentation/view/product_view.dart';
import '../../profile/presentation/controller/profile_controller.dart';
import '../../profile/presentation/view/profile.dart';
import '../../welcome/presentation/views/welcome_screen.dart';

class NavController extends GetxController {
  var currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> screens = [
    const HomeView(),
    const ProductView(),
    const FavoriteView(),
    const SavedProductsScreen(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final NavController navController = Get.put(NavController());

    return Obx(() {
      return Scaffold(
        body: screens[navController.currentIndex.value],
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.blue,
          activeColor: Colors.white,
          items: const [
            TabItem(icon: Icons.home_filled, title: 'Home'),
            TabItem(icon: Icons.production_quantity_limits, title: 'Products'),
            TabItem(icon: Icons.favorite_border_outlined, title: 'Favorites'),
            TabItem(icon: Icons.archive, title: 'Saved'),
            TabItem(icon: Icons.person, title: 'Profile'),
          ],
          initialActiveIndex: navController.currentIndex.value,
          onTap: (int index) {
            navController.changeIndex(index);
          },
        ),
      );
    });
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.logout_outlined,
            ),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove('token');
              print(prefs.getString('token'));
              Get.offAll(() => const WelcomeScreen());
            },
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Profile(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      // استخدام FutureBuilder لعرض الاسم المخزن في SharedPreferences
                      FutureBuilder<String?>(
                        future: profileController.getNameFromPrefs(), // جلب الاسم المخزن
                        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator(); // مؤشر تحميل
                          } else if (snapshot.hasError) {
                            return const Text('Error loading name'); // في حال وجود خطأ
                          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return const Text('No name available'); // إذا لم يكن هناك بيانات
                          } else {
                            return Text(
                              snapshot.data!, // عرض الاسم المخزن
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          }
                        },
                      ),
                      const Expanded(
                        child: Row(
                          children: [
                            Text(
                              'حى شرق- ',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'المنوفية ',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                            Icon(
                              Icons.place,
                              size: 15,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/profile.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: const HomeBody(),
    );
  }
}
