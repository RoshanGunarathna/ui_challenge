// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final String id;
  final String name;
  final String image;
  final double price;
  final String? shortDescription;
  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.shortDescription,
  });
}
