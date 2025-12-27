import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              borderRadius: BorderRadius.circular(20.r),
              side: isProductInCart
                  ? BorderSide(color: Color(0xff05AF6F), width: 1)
                  : BorderSide(color: Colors.grey.shade500, width: .5)
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
                      ? Icons.check_circle_outline
                      : Icons.add_shopping_cart,
                  key: ValueKey<bool>(
                    isProductInCart,
                  ),
                  size: 16.sp,
                  color: isProductInCart
                      ? Color(0xff05AF6F)
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
