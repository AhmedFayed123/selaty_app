class SubCategory {
  final int id;
  final int ord;
  final String type;
  final int parentId;
  final String name;
  final String img;
  final String details;

  SubCategory({
    required this.id,
    required this.ord,
    required this.type,
    required this.parentId,
    required this.name,
    required this.img,
    required this.details,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      ord: json['ord'],
      type: json['type'],
      parentId: json['parent_id'],
      name: json['name'],
      img: json['img'],
      details: json['details'],
    );
  }
}
