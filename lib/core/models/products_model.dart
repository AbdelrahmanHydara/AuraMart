import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/core/models/review_model.dart';

class ProductsModel {
  final String code;
  final String name;
  final String description;
  final int price;
  final int quantity;
  final int? discount;
  final int? oldPrice;
  final int sellingCount;
  final List<ReviewModel> reviews;
  final DateTime createdAt;
  String? imageUrl;

  ProductsModel({
    this.imageUrl,
    required this.sellingCount,
    required this.code,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.reviews,
    required this.discount,
    required this.oldPrice,
    required this.createdAt,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      code: json['code'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toInt(),
      quantity: json['quantity'],
      discount: json['discount'],
      oldPrice: json['oldPrice'],
      imageUrl: json['imageUrl'],
      sellingCount: json['sellingCount'] ?? 0,
      createdAt: json['createdAt'] != null
          ? (json['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
      reviews: (json['reviews'] as List)
          .map((review) => ReviewModel.fromJson(review))
          .toList(),
    );
  }

  ProductsEntity toEntity() {
    return ProductsEntity(
      code: code,
      name: name,
      description: description,
      price: price,
      quantity: quantity,
      discount: discount,
      oldPrice: oldPrice,
      imageUrl: imageUrl,
      reviews: reviews.map((review) => review.toEntity()).toList(),
      categoryId: '',
    );
  }

  toMap() {
    return {
      'code': code,
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'discount': discount,
      'imageUrl': imageUrl,
      'oldPrice': oldPrice,
      'sellingCount': sellingCount,
      'createdAt': createdAt,
      'reviews': reviews.map((review) => review.toJson()).toList(),
    };
  }
}