part of 'cart_item_cubit.dart';

@immutable
sealed class CartItemState {}

final class CartItemInitial extends CartItemState {}

final class CartItemAdded extends CartItemState {}

final class CartItemRemoved extends CartItemState {}

final class CartCleared extends CartItemState {}

final class CartItemUpdated extends CartItemState {
  final CartItemEntity cartItemEntity;

  CartItemUpdated({required this.cartItemEntity});
}
