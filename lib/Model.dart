import 'dart:convert';

import 'package:http/http.dart' as http;

class Product {
  final String title;
  final String image;
  final price;
  Product({this.title, this.image, this.price});
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        title: json['title'], image: json['image'], price: json["price"]);
  }
}

class Network {
  Future<List<Product>> fetchData() async {
    String url = "https://fakestoreapi.com/products";
    final response = await http.get(url);
    Iterable result = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return result.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
