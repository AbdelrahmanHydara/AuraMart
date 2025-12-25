import 'review_entity.dart';

class ProductsEntity {
  final String code;
  final String name;
  final String description;
  final int price;
  final int quantity;
  final int? discount;
  final int? oldPrice;
  final String categoryId;
  final int ratingCount = 0;
  final int totalRating = 0;
  final List<ReviewEntity> reviews;
  String? imageUrl;

  ProductsEntity({
    this.discount,
    this.oldPrice,
    this.imageUrl,
    required this.code,
    required this.name,
    required this.reviews,
    required this.description,
    required this.price,
    required this.quantity,
    required this.categoryId,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProductsEntity &&
              runtimeType == other.runtimeType &&
              code == other.code;

  @override
  int get hashCode => code.hashCode;

}