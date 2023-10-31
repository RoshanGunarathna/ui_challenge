// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final String id;
  final String name;
  final List<String> image;
  final double price;
  final String? shortDescription;
  final String description;
  final List<double> height;
  final List<double> temperature;
  final String pot;
  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.shortDescription,
    required this.description,
    required this.height,
    required this.temperature,
    required this.pot,
  });
}
