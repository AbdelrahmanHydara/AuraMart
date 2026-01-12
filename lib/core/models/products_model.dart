import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/core/models/review_model.dart';

class ProductsModel {
  final String code;
  final String name;
  final String category;
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
    required this.category,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      code: json['code'],
      name: json['name'],
      category: json['category'],
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

  factory ProductsModel.fromEntity(ProductsEntity entity) {
    return ProductsModel(
      code: entity.code,
      name: entity.name,
      category: entity.category,
      description: entity.description,
      price: entity.price,
      quantity: entity.quantity,
      discount: entity.discount,
      oldPrice: entity.oldPrice,
      imageUrl: entity.imageUrl,
      sellingCount: 0,
      createdAt: DateTime.now(),
      reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
    );
  }

  ProductsEntity toEntity() {
    return ProductsEntity(
      code: code,
      name: name,
      category: category,
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
      'category': category,
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