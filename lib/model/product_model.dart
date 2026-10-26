// class Product {
//   final String name;
//   final int quantity;
//   final double unitPrice;
//   final String code;
//   final String imageUrl;
//
//   Product({
//     required this.name,
//     required this.quantity,
//     required this.unitPrice,
//     required this.code,
//     required this.imageUrl,
// });
// }
import 'package:flutter/material.dart';

class Product {
  late String title;
  late int id;
  late int stock;
  late double price;

  Product ({
  required this.title,
  required this.id,
  required this.stock,
  required this.price,
});


   Product.fromJson(Map<String, dynamic> productJson) {
     title = productJson['title'];
      id = productJson['id'];
      stock = productJson['stock'];
      price = productJson['price'];
  }
}
