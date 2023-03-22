// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class ProdutoModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  ProdutoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  //!aqui eu transformo em um map
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "price": price,
      "discountPercentage": discountPercentage,
      "rating": rating,
      "stock": stock,
      "brand": brand,
      "category": category,
      "thumbnail": thumbnail,
      "images": images,
    };
  }

  String toJson() => jsonEncode(toMap());

  //!a api é um MAP(uma lista de objeto "poderia ser só um objeto"), então o 'fromMap' quer dizer -> pegando do map
  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      id: map["id"] ?? 0,
      title: map["title"] ?? "",
      description: map["description"] ?? "",
      price: map["price"] * 1.0 ??
          0.0, //!-> * 1.0 pois o preço pode ter numero querbado(entao esse calculo converte o inteiro pra double)
      discountPercentage: map["discountPercentage"] * 1.0 ??
          0.0, //!-> * 1.0 pois o preço pode ter numero querbado(entao esse calculo converte o inteiro pra double)
      rating: map["rating"] * 1.0 ??
          0.0, //!-> * 1.0 pois o preço pode ter numero querbado(entao esse calculo converte o inteiro pra double)
      stock: map["stock"] ?? 0,
      brand: map["brand"] ?? "",
      category: map["category"] ?? "",
      thumbnail: map["thumbnail"] ?? "",
      images: List<String>.from(map["images"] ?? <String>[]),
    );
  }

  factory ProdutoModel.fromJson(String json) =>
      ProdutoModel.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'DummyProductsModel(id: $id, title: $title, description: $description, price: $price, discountPercentage: $discountPercentage, rating: $rating, stock: $stock, brand: $brand, category: $category, thumbnail: $thumbnail, images: $images)';
  }
}
