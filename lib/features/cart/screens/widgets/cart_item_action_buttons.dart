import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_container.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'package:shopx/features/cart/cubit/cart_item_cubit.dart';
import 'package:shopx/features/cart/entity/cart_item_entity.dart';
import 'cart_item_action_button.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({
    super.key,
    required this.cartItemEntity,
  });

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.symmetric(horizontal: 10.w,),
      color: blueColor,
      height: 34.h,
      radius: 30.r,
      borderColor: whiteColor,
      child: Row(
        children: [
          CartItemActionButton(
            icon: CupertinoIcons.minus_circle,
            color: Colors.red,
            onPressed: () {
              cartItemEntity.deCreaseCount();
              context.read<CartItemCubit>().updateCartItem(cartItemEntity);
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextWidgets.heading(
              '${cartItemEntity.count}',
              fontSize: 26.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          CartItemActionButton(
            icon: CupertinoIcons.add_circled,
            color: Colors.green,
            onPressed: () {
              cartItemEntity.inCreaseCount();
              context.read<CartItemCubit>().updateCartItem(cartItemEntity);
            },
          )
        ],
      ),
    );
  }
}

