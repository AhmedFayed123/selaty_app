import 'package:get/get.dart';
import '../../../../services/auth_service.dart';
import '../../../home_screen/model/model.dart';
import '../../model/category_model.dart';

class CategoryController extends GetxController {
  var categories = <Category>[].obs;
  var isLoading = true.obs;
  final CategoryService _categoryService = CategoryService();

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      isLoading(true);
      categories.value = await _categoryService.fetchCategories();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch categories: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
      print('Error fetching categories: $e'); // Log the error for debugging
    } finally {
      isLoading(false);
    }
  }
}

class CategoryDetailsController extends GetxController {
  var categoryDetails = <SubCategory>[].obs; // Observable list for subcategories
  var isLoading = true.obs; // Observable for loading state
  final CategoryDetailsService _categoryDetailsService = CategoryDetailsService();

  // This variable will hold the selected category ID
  int? selectedCategoryId;

  // Method to set the selected category ID and fetch details
  void setCategoryId(int id) {
    selectedCategoryId = id;
    fetchCategoryDetails();
  }

  // Method to fetch details for the selected category
  void fetchCategoryDetails() async {
    if (selectedCategoryId == null) {
      Get.snackbar('Error', 'No category selected');
      return;
    }

    try {
      isLoading(true);
      categoryDetails.value = await _categoryDetailsService.fetchCategoryDetails(selectedCategoryId!);
    } catch (e) {
      // Enhanced error handling
      String errorMessage = 'Failed to fetch category details: ${e.toString()}';
      Get.snackbar('Error', errorMessage, snackPosition: SnackPosition.BOTTOM);
      print(errorMessage); // Log the error for debugging
    } finally {
      isLoading(false);
    }
  }
}
