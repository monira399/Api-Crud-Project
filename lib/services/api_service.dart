// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../model/product_model.dart';
// // import 'product.dart';
//
// class ApiService {
//   static Future<List<Product>> fetchProducts() async {
//     final response =
//     await http.get(Uri.parse("https://fakestoreapi.com/products"));
//
//     if (response.statusCode == 200) {
//       List data = json.decode(response.body);
//       return data.map((json) => Product.fromJson(json)).toList();
//     } else {
//       throw Exception("Failed to load products");
//     }
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/product_model.dart';

class ApiService {
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://dummyjson.com/products"),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List products = data['products'];
      return products.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
