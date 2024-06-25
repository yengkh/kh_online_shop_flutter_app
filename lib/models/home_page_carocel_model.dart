class CarocelModel {
  final String id;
  final String title;
  final String imageUrl;

  CarocelModel({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  factory CarocelModel.fromJson(Map<String, dynamic> json) {
    return CarocelModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['image_url'],
    );
  }
}
