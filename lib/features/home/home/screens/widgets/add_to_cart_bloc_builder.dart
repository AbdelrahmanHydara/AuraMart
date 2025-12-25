import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/features/cart/cubit/cart_item_cubit.dart';

class AddToCartBlocBuilder extends StatelessWidget {
  const AddToCartBlocBuilder({super.key, required this.product});

  final ProductsEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        final bool isProductInCart = context
            .read<CartItemCubit>()
            .cartEntity
            .isExist(product);
        return GestureDetector(
          onTap: () {
            context.read<CartItemCubit>().addCartItem(product);
          },
          child: Card(
            color: isProductInCart ? Color(0xFFE8F5E9) : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: isProductInCart
                  ? BorderSide(color: Colors.green, width: 1)
                  : BorderSide.none,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                      scale: animation,
                      child: child,
                  );
                },
                child: Icon(
                  isProductInCart
                      ? Icons.done_all
                      : Icons.add_shopping_cart,
                  key: ValueKey<bool>(
                    isProductInCart,
                  ),
                  size: 18,
                  color: isProductInCart
                      ? Colors.green
                      : Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
