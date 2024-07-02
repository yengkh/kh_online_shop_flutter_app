class ProductItemModel {
  final String id;
  final String name;
  final String detail;
  final String uploadDate;
  final String productType;
  final String productBrand;
  final List<Map<String, dynamic>> price;
  final List<Map<String, dynamic>> comment;
  final List<Map<String, dynamic>> rating;
  final List<Map<String, dynamic>> images;
  final int productQuantity;

  ProductItemModel({
    required this.id,
    required this.name,
    required this.detail,
    required this.uploadDate,
    required this.productType,
    required this.productBrand,
    required this.price,
    required this.comment,
    required this.rating,
    required this.images,
    required this.productQuantity,
  });

  factory ProductItemModel.fromJson(Map<String, dynamic> json) {
    return ProductItemModel(
      id: json['id'],
      name: json['name'],
      detail: json['detail'],
      uploadDate: json['upload_date'],
      productType: json['product_type'],
      productBrand: json['product_brand'],
      productQuantity: json['product_quantity'],
      // price: _getPrice(json['price_models']),
      price: json['prices'] != null
          ? List<Map<String, dynamic>>.from(json['prices'] as List)
          : [],
      comment: json['comments'] != null
          ? List<Map<String, dynamic>>.from(json['comments'] as List)
          : [],
      rating: json['ratings'] != null
          ? List<Map<String, dynamic>>.from(json['ratings'] as List)
          : [],
      images: _parseImages(json['images']),
    );
  }

  static List<Map<String, dynamic>> _parseImages(dynamic imagesJson) {
    if (imagesJson == null) {
      return [];
    }

    // Define which keys you expect for images
    List<String> imageKeys = [
      'black_color',
      'white_color',
      'other_color_one',
      'other_color_two'
    ];

    List<Map<String, dynamic>> imagesList = [];

    // Iterate through each image in the JSON array
    for (var image in imagesJson) {
      Map<String, dynamic> parsedImage = {};

      // Check each key and add to parsedImage if it exists
      for (var key in imageKeys) {
        if (image[key] != null) {
          parsedImage[key] = image[key];
        }
      }

      // Add parsedImage to imagesList if it's not empty
      if (parsedImage.isNotEmpty) {
        imagesList.add(parsedImage);
      }
    }

    return imagesList;
  }
}
