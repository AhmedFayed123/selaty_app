class FavoriteProduct {
  final int id; // ID for the favorite item itself
  final int favoId; // ID for the favorite product
  final String name; // Product name
  final String details; // Product details
  final String img; // Product image URL
  final double price; // Product price

  FavoriteProduct({
    required this.id,
    required this.favoId,
    required this.name,
    required this.details,
    required this.img,
    required this.price,
  });

  factory FavoriteProduct.fromJson(Map<String, dynamic> json) {
    return FavoriteProduct(
      id: json['id'],
      favoId: json['favo_id'],
      name: json['product']['name'], // Extracting name from product
      details: json['product']['details'], // Extracting details from product
      img: json['product']['img'], // Extracting image URL from product
      price: double.tryParse(json['product']['price']) ?? 0.0, // Parsing price to double
    );
  }
}
