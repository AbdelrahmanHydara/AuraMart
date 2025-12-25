import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_divider.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/features/cart/cubit/cart_item_cubit.dart';
import 'package:shopx/features/cart/entity/cart_item_entity.dart';
import 'cart_bottom_sheet.dart';
import 'cart_item_bloc_builder.dart';

class CartItemBody extends StatelessWidget {
  const CartItemBody({super.key, required this.cartItems});

  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartItemCubit>();

    return Stack(
      children: [
        verticalSpace(20),
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                CartItemBlocBuilder(cartItemEntity: cartItems[index]),
                const CustomDivider(),
              ],
            );
          },
        ),
        cubit.cartEntity.cartItems.isEmpty
            ? const SizedBox()
            : Positioned(
                left: 24.w,
                right: 24.w,
                bottom: 116.h,
                child: const CartBottomSheet(),
              ),
      ],
    );
  }
}
