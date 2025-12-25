import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/features/cart/entity/cart_entity.dart';
import 'package:shopx/features/cart/entity/cart_item_entity.dart';
part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

  CartEntity cartEntity = CartEntity(cartItems: []);

  void addCartItem(ProductsEntity product) {
    bool isProductExist = cartEntity.isExist(product);
    var cartItem = cartEntity.getCartItem(product);
    if (isProductExist) {
      cartItem.inCreaseCount();
      return;
    } else {
      cartEntity.addCartItem(cartItem);
    }
    emit(CartItemAdded());
  }

  void removeCartItem(CartItemEntity cartItemEntity) {
    cartEntity.removeCartItem(cartItemEntity);
    emit(CartItemRemoved());
  }

  void clearAllCart() {
    cartEntity.cartItems.clear();
    emit(CartCleared());
  }

  void updateCartItem(CartItemEntity cartItemEntity) {
    emit(CartItemUpdated(cartItemEntity: cartItemEntity));
  }
}
