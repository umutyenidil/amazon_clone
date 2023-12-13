import 'dart:io';

class AddProductFormModel {
  final List<File> productImages;
  final String productName;
  final String productDescription;
  final double productPrice;
  final int productQuantity;
  final String categoryId;

  AddProductFormModel({
    required this.productImages,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productQuantity,
    required this.categoryId,
  });
}
