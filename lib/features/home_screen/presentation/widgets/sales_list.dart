import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class SalesList extends StatelessWidget {
  SalesList({super.key});

  final CategoryListController controller = Get.put(CategoryListController()); // جلب البيانات باستخدام GetX

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator()); // عرض مؤشر تحميل
      }

      if (controller.categories.isEmpty) {
        return const Center(child: Text('لا توجد فئات متاحة.'));
      }

      return SizedBox(
        height: 110,
        child: ListView.builder(
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var category = controller.categories[index]; // الحصول على الفئة الحالية
            return ListItem(
              categoryName: category.name,
              imageUrl: 'https://master-market.masool.net/uploads/${category.img}', // صورة الفئة
            );
          },
        ),
      );
    });
  }
}

class ListItem extends StatelessWidget {
  final String categoryName;
  final String imageUrl;

  const ListItem({
    required this.categoryName,
    required this.imageUrl,
    super.key,
  });

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
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      categoryName, // عرض اسم الفئة
                      style: const TextStyle(
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
                  child: Image.network(
                    imageUrl, // عرض صورة الفئة من URL
                    fit: BoxFit.cover,
                    width: 80,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/images/fruits_img.jpg'); // صورة بديلة في حالة الخطأ
                    },
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
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.orange,
                child: Image.network(
                  imageUrl, // عرض صورة الفئة من URL
                  fit: BoxFit.cover,
                  width: 35,
                  height: 35,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/fruits_img.jpg'); // صورة بديلة في حالة الخطأ
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
