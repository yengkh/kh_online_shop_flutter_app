class ProductCategoryModel {
  final String id;
  final String name;
  final String imageUrl;

  ProductCategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}
