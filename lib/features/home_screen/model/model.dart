import '../../categories/model/category_model.dart';

class Advertisement {
  final int id;
  final int ord;
  final String type;
  final String? name;
  final String img;
  final String? urlL;
  final int withId;

  Advertisement({
    required this.id,
    required this.ord,
    required this.type,
    this.name,
    required this.img,
    this.urlL,
    required this.withId,
  });

  factory Advertisement.fromJson(Map<String, dynamic> json) {
    return Advertisement(
      id: json['id'],
      ord: json['ord'],
      type: json['type'],
      name: json['name'],
      img: json['img'],
      urlL: json['url_l'],
      withId: json['with_id'],
    );
  }
}
class Category {
  final int id;
  final int ord;
  final String type;
  final int parentId;
  final String name;
  final String img;
  final String details;
  final List<SubCategory> subCat;

  Category({
    required this.id,
    required this.ord,
    required this.type,
    required this.parentId,
    required this.name,
    required this.img,
    required this.details,
    required this.subCat,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var subCatFromJson = json['sub_cat'] as List<dynamic>? ?? [];
    List<SubCategory> subCategories = subCatFromJson
        .map((subCatJson) => SubCategory.fromJson(subCatJson))
        .toList();

    return Category(
      id: json['id'],
      ord: json['ord'],
      type: json['type'],
      parentId: json['parent_id'],
      name: json['name'],
      img: json['img'],
      details: json['details'],
      subCat: subCategories,
    );
  }
}
