import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Product {
  final int id;
  final String name;
  final String details;
  final String img;
  final double price;
  final double priceAfterDiscount;
  var isFavorite = false.obs; // Make it an RxBool

  Product({
    required this.id,
    required this.name,
    required this.details,
    required this.img,
    required this.price,
    required this.priceAfterDiscount,
    bool isFavorite = false, // Initial value
  }) {
    this.isFavorite.value = isFavorite; // Set the initial value
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'] ?? '',
      details: json['details'] ?? '',
      img: json['img'] ?? '',
      price: double.parse(json['price'].toString()), // Convert to double
      priceAfterDiscount: double.parse(json['price_after_discount'].toString()), // Convert to double
      isFavorite: json['is_favorite'] == 1, // Assuming API returns 1 for favorite
    );
  }

  // Save favorite status to SharedPreferences
  Future<void> saveFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('favorite_$id', isFavorite.value);
  }

  // Load favorite status from SharedPreferences
  static Future<bool> loadFavoriteStatus(int productId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('favorite_$productId') ?? false; // Default to false if not found
  }
  // Convert Product to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'details': details,
      'img': img,
      'price': price,
      'priceAfterDiscount': priceAfterDiscount,
      'isFavorite': isFavorite.value ? 1 : 0, // Store as 1 or 0
    };
  }

  // Convert Map to Product
  static Product fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      details: map['details'],
      img: map['img'],
      price: map['price'],
      priceAfterDiscount: map['priceAfterDiscount'],
      isFavorite: map['isFavorite'] == 1,
    );
  }
}
