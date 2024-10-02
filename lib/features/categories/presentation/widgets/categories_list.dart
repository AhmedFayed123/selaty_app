import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../category_details.dart';
import '../controller/category_controller.dart';

class CategoriesList extends StatelessWidget {
  CategoriesList({super.key});

  final CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.categories.isEmpty) {
        return const Center(child: Text('لا توجد فئات متاحة.'));
      }

      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 18,
          crossAxisSpacing: 15,
          childAspectRatio: 2 / 3,
        ),
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.categories.length,
        itemBuilder: (BuildContext context, int index) {
          var category = controller.categories[index];
          return ListItem(
            categoryName: category.name,
            imageUrl: 'https://master-market.masool.net/uploads/${category.img}',
            categoryId: category.id, // تمرير الـ ID هنا
          );
        },
      );
    });
  }
}

class ListItem extends StatelessWidget {
  final String categoryName;
  final String imageUrl;
  final int categoryId; // إضافة الـ ID هنا

  const ListItem({
    required this.categoryName,
    required this.imageUrl,
    required this.categoryId, // إضافة الـ ID هنا
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // تمرير الـ ID عند الانتقال إلى شاشة التفاصيل
        Get.to(() => CategoryDetails(categoryId: categoryId,));
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                color: Colors.white,
                width: 300,
                height: 110,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    categoryName,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Image.network(
                  imageUrl,
                  width: 200,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/fruits_img.jpg');
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: 80,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Container(
                  color: Colors.orange,
                  child: Image.network(
                    imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/images/fruits_img.jpg');
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
