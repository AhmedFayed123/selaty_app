import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class AdvertisementList extends StatelessWidget {
  AdvertisementList({super.key});
  final AdvertisementController controller = Get.put(AdvertisementController());

  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        if (controller.advertisements.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.advertisements.length,
            itemBuilder: (context, index) {
              var ad = controller.advertisements[index];
              return AdvertisementItem(
                imageUrl: 'https://master-market.masool.net/uploads/${ad.img}', // استخدام النقطة للوصول إلى الصورة
              );
            },
          ),
        );
      },
    );
  }
}

class AdvertisementItem extends StatelessWidget {
  final String imageUrl;

  const AdvertisementItem({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          imageUrl,
          width: 300,
          height: 100,
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            print('Failed to load image: $imageUrl'); // طباعة عنوان URL عند حدوث خطأ

            return Image.asset(
              'assets/images/fruits_category.jpg', // صورة احتياطية
            );
          },
        ),
      ),
    );
  }
}
