import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shopping_cart/presentation/shopping_cart_screen/shopping_cart_screen.dart';
import '../controller/category_controller.dart';

class CategoryDetailsList extends StatelessWidget {
  const CategoryDetailsList({super.key, required this.categoryId});
  final int categoryId; // تأكد من تمرير معرف الفئة المطلوبة

  @override
  Widget build(BuildContext context) {
    final CategoryDetailsController controller = Get.put(CategoryDetailsController());
    controller.setCategoryId(categoryId); // تعيين معرف الفئة هنا

    return Obx(() {
      // التأكد من أن البيانات محملة
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.categoryDetails.isEmpty) {
        return const Center(child: Text('لا توجد تفاصيل'));
      } else {
        return SizedBox(
          width: 500,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 3 / 6,
            ),
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.categoryDetails.length, // عدد العناصر بناءً على طول القائمة
            itemBuilder: (BuildContext context, int index) {
              return ListItem(categoryId: categoryId, index: index);
            },
          ),
        );
      }
    });
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.categoryId, required this.index});
  final int categoryId; // تأكد من تمرير معرف الفئة المطلوبة
  final int index; // تمرير الـ index

  @override
  Widget build(BuildContext context) {
    final CategoryDetailsController controller = Get.put(CategoryDetailsController());

    final subCategory = controller.categoryDetails[index]; // استخدم الفئة الفرعية بناءً على الـ index

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ShoppingCartScreen()),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.greenAccent,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 30,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(16),
                        ),
                        color: Colors.green,
                      ),
                      child: const Center(
                        child: Text(
                          'جديد',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                'https://master-market.masool.net/uploads/${subCategory.img}',
                fit: BoxFit.fill,
                width: 250,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.green,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Text(
                            subCategory.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subCategory.details,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${subCategory.ord}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
