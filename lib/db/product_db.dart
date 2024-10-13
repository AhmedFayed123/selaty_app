import 'package:sqflite/sqflite.dart';

import '../features/products/models/product_model.dart';

class ProductDB {
  static final ProductDB _instance = ProductDB._internal();
  static Database? _database;

  ProductDB._internal();

  factory ProductDB() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // Specify the database file directly.
    String path = "data/user/0/com.your_package_name/databases/product.db"; // Change 'your_package_name' to your actual package name

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE products(
            id INTEGER PRIMARY KEY,
            name TEXT,
            details TEXT,
            img TEXT,
            price REAL,
            priceAfterDiscount REAL,
            isFavorite INTEGER
          )
        ''');
      },
    );
  }

  Future<void> addProduct(Product product) async {
    final db = await database;
    await db.insert('products', product.toMap());
  }

  Future<List<Product>> getProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');

    return List.generate(maps.length, (i) {
      return Product.fromMap(maps[i]);
    });
  }

  Future<void> updateProduct(Product product) async {
    final db = await database;
    await db.update(
      'products',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<void> deleteProduct(int id) async {
    final db = await database;
    await db.delete(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}