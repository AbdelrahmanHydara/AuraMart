import 'package:shopx/core/entity/products_entity.dart';

class CartEntity {
  final ProductsEntity productsEntity;
  final int count;

  CartEntity({
    required this.productsEntity,
    required this.count,
  });
}
