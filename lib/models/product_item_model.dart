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
  });

  factory ProductItemModel.fromJson(Map<String, dynamic> json) {
    return ProductItemModel(
      id: json['id'],
      name: json['name'],
      detail: json['detail'],
      uploadDate: json['upload_date'],
      productType: json['product_type'],
      productBrand: json['product_brand'],
      // price: _getPrice(json['price_models']),
      price: json['prices'] != null
          ? List<Map<String, dynamic>>.from(json['prices'])
          : [],
      comment: json['comments'] != null
          ? List<Map<String, dynamic>>.from(json['comments'])
          : [],
      rating: json['ratings'] != null
          ? List<Map<String, dynamic>>.from(json['ratings'])
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

  static List<Map<String, dynamic>> _getPrice(dynamic jsonPrice) {
    if (jsonPrice == null) {
      return [];
    }

    List<String> priceKeys = [
      'default_price',
      'discount_rate',
      'discount_price',
      'total_price',
    ];

    List<Map<String, dynamic>> priceList = [];

    for (var price in jsonPrice) {
      Map<String, dynamic> parsPrice = {};

      for (var key in priceKeys) {
        if (price[key] != null) {
          parsPrice[key] = price[key];
        }
        if (parsPrice.isNotEmpty) {
          priceList.add(parsPrice);
        }
      }
    }

    return priceList;
  }
}
