import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/components/custom_divider.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/features/cart/cubit/cart_item_cubit.dart';
import 'package:shopx/features/cart/entity/cart_item_entity.dart';
import 'cart_bottom_sheet.dart';
import 'cart_empty_bag_body.dart';
import 'cart_item_bloc_builder.dart';

class CartBodyScreen extends StatelessWidget {
  const CartBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CartItemEntity> cartItems = context.read<CartItemCubit>().cartEntity.cartItems;
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        if (cartItems.isEmpty) {
          return const CartEmptyBagBody();
        }
        return Stack(
          children: [
            Column(
              children: [
                verticalSpace(10),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: cartItems.length,
                    separatorBuilder: (context, index) => const CustomDivider(),
                    itemBuilder: (context, index) =>
                        CartItemBlocBuilder(cartItemEntity: cartItems[index]),
                  ),
                ),
                verticalSpace(50),
              ],
            ),
            cartItems.isEmpty
                ? const SizedBox()
                : const CartBottomSheet(),
          ],
        );
      },
    );
  }
}
