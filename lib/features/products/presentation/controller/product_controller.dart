
import 'package:get/get.dart';

import '../../../../services/auth_service.dart';
import '../../models/product_model.dart';


class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  final ProductService productService = ProductService();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await productService.fetchProducts();
      productList.assignAll(products);
    } catch (e) {
      print("Error fetching products: $e");
    } finally {
      isLoading(false);
    }
  }
}
