class ProductBrandModel {
  final String id;
  final String name;
  final String imageUrl;

  ProductBrandModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory ProductBrandModel.fromJson(Map<String, dynamic> json) {
    return ProductBrandModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}
