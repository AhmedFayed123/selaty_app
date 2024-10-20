import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../db/product_db.dart';
import '../../../../../services/auth_service.dart';
import '../../controller/product_controller.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());

    return Scaffold(
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: productController.productList.length,
            itemBuilder: (context, index) {
              final product = productController.productList[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child:Image.network(
                          "https://master-market.masool.net/uploads/${product.img}",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset('assets/images/category_icon.png'); // Use a local fallback image
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(product.details),
                            const SizedBox(height: 5),
                            // السعر الأصلي
                            Text(
                              "\$${product.price.toStringAsFixed(2)}",
                              style: const TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough, // خط على السعر الأصلي
                              ),
                            ),
                            // السعر بعد الخصم
                            Text(
                              "\$${product.priceAfterDiscount.toStringAsFixed(2)}",
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Obx(() => Icon(
                              product.isFavorite.value ? Icons.favorite : Icons.favorite_border,
                              color: product.isFavorite.value ? Colors.red : null,
                            )),
                            onPressed: () {
                              ProductService().toggleFavorite(context, product);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.archive_outlined), // Save icon
                            onPressed: () async {
                              final productDb = ProductDB();
                              await productDb.addProduct(product); // Add product to the database

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Product saved to favorites!')),
                              );
                            },
                          ),
                        ],
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
