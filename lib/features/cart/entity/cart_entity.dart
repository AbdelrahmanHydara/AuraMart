import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/features/cart/entity/cart_item_entity.dart';

class CartEntity {

  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  addCartItem(CartItemEntity cartItem) {
    cartItems.add(cartItem);
  }

  removeCartItem(CartItemEntity cartItem) {
    cartItems.remove(cartItem);
  }

  clearCart() {
    cartItems.clear();
  }

  int calculateTotalPrice() {
    int totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item.productsEntity.price * item.count;
    }
    return totalPrice;
  }

  bool isExist(ProductsEntity product) {
    for (var item in cartItems) {
      if (item.productsEntity == product) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductsEntity product) {
    for (var item in cartItems) {
      if (item.productsEntity == product) {
        return item;
      }
    }
    return CartItemEntity(
      productsEntity: product,
      count: 1,
    );
  }
}