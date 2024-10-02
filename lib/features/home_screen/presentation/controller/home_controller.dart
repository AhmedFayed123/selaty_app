import 'dart:convert';

import 'package:get/get.dart';


import '../../../../services/auth_service.dart';
import '../../model/model.dart';
import 'package:http/http.dart' as http;

class AdvertisementController extends GetxController {
  var advertisements = [].obs; // لائحة لحفظ البيانات
  final AdvertisementService advertisementService = AdvertisementService();

  @override
  void onInit() {
    fetchAdvertisements();
    super.onInit();
  }

  void fetchAdvertisements() async {
    try {
      final ads = await advertisementService.fetchAdvertisements();
      advertisements.assignAll(ads); // تحديث القائمة بالإعلانات المحملة
    } catch (e) {
      Get.snackbar('Error', 'Failed to load advertisements: $e');
    }
  }
}
class CategoryListController extends GetxController {
  var categories = <Category>[].obs; // قائمة الفئات
  var isLoading = true.obs; // حالة التحميل
  final CategoryService _categoryService = CategoryService();

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  void fetchCategories() async {
    try {
      isLoading(true);
      categories.value = await _categoryService.fetchCategories();
    } catch (e) {
      print('Error fetching categories: $e');
    } finally {
      isLoading(false);
    }
  }
}