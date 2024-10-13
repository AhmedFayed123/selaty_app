import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/favorite_controller.dart';

class FavoriteListScreen extends StatelessWidget {
  const FavoriteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController = Get.put(FavoriteController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Obx(() {
        if (favoriteController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (favoriteController.favoriteList.isEmpty) {
          return const Center(child: Text('No Favorites Found.'));
        } else {
          return ListView.builder(
            itemCount: favoriteController.favoriteList.length,
            itemBuilder: (context, index) {
              final favorite = favoriteController.favoriteList[index];

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      // Image Section
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.network(
                          "https://master-market.masool.net/uploads/${favorite.img}",
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset('assets/images/category_icon.png'); // Default fallback image
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Product Details Section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              favorite.name, // Directly using favorite.name
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(favorite.details), // Directly using favorite.details
                            const SizedBox(height: 5),
                            Text(
                              "\$${favorite.price.toStringAsFixed(2)}", // Directly using favorite.price
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
