import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/features/cart/cubit/cart_item_cubit.dart';
import 'cart_body_screen.dart';

class CartBodyBlocBuilder extends StatelessWidget {
  const CartBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CartBodyScreen(
        cartItems: context.watch<CartItemCubit>().cartEntity.cartItems
    );
  }
}
