import 'dart:convert';

class ProductModel {
  final String name;
  final String description;
  final double price;
  final double quantity;
  final String categoryId;
  final List<String> images;
  String? id;
  String? userId;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.categoryId,
    required this.images,
    this.id,
    this.userId,
  });

  ProductModel copyWith({
    String? name,
    String? description,
    double? price,
    double? quantity,
    String? categoryId,
    List<String>? images,
  }) =>
      ProductModel(
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        categoryId: categoryId ?? this.categoryId,
        images: images ?? this.images,
      );

  factory ProductModel.fromJson(String str) => ProductModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        quantity: json["quantity"]?.toDouble(),
        categoryId: json["categoryId"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "description": description,
        "price": price,
        "quantity": quantity,
        "categoryId": categoryId,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
