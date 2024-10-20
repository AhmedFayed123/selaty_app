import 'package:flutter/material.dart';
import 'package:task1/features/categories/presentation/widgets/category_details_body.dart';
import 'package:task1/utils/custom_bottom_nav_bar.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key, required this.categoryId});
  final int categoryId; // تأكد من تمرير معرف الفئة المطلوبة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoryDetailsBody(categoryId: categoryId,),
    );
  }
}
