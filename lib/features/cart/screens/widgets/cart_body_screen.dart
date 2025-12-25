import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/features/cart/cubit/cart_item_cubit.dart';
import 'cart_empty_bag_body.dart';
import 'cart_item_body.dart';

class CartBodyScreen extends StatelessWidget {
  const CartBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartItemCubit>();

    return cubit.cartEntity.cartItems.isEmpty
        ? const CartEmptyBagBody()
        : CartItemBody(
            cartItems: cubit.cartEntity.cartItems,
          );
  }
}
