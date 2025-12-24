import 'package:shopx/core/entity/products_entity.dart';

class CartItemEntity {
  final ProductsEntity productsEntity;
  int count;

  CartItemEntity({
    required this.productsEntity,
    this.count = 0,
  });

  // Methods to increase and decrease count
  inCreaseCount() {
    count++;
  }

  // Methods to increase and decrease count
  deCreaseCount() {
    if (count > 0) {
      count--;
    }
  }
}
