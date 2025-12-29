import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_avif_image.dart';
import 'package:shopx/core/components/custom_card_details.dart';
import 'package:shopx/core/components/custom_confirmation_dialog.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'package:shopx/features/cart/cubit/cart_item_cubit.dart';
import 'package:shopx/features/cart/entity/cart_item_entity.dart';
import 'cart_button_delete.dart';
import 'cart_item_action_buttons.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return Padding(
      padding: EdgeInsets.only(right: 12.w, left: 12.w, top: 10.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: CustomAvifImage(
                      imageUrl: cartItemEntity.productsEntity.imageUrl ?? "",
                    ),
                  ),
                  if (cartItemEntity.productsEntity.discount != 0)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.r),
                            bottomRight: Radius.circular(12.r),
                          ),
                        ),
                        child: TextWidgets.bodyText1(
                          "${cartItemEntity.productsEntity.discount}% Discount",
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                      ),
                    ),
                ],
              ),
              horizontalSpace(10),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 5.w,
                  ),
                  child: CustomCardDetails(
                    maxLinesName: 8,
                    name: cartItemEntity.productsEntity.name,
                    quantity: cartItemEntity.productsEntity.quantity,
                    oldPrice: cartItemEntity.productsEntity.oldPrice,
                    price: cartItemEntity.productsEntity.price,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 12.w, left: 12.w, bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CartItemActionButtons(cartItemEntity: cartItemEntity),
                Row(
                  children: [
                    TextWidgets.bodyText(
                      "${AppStrings.totalPrice} : ",
                      fontSize: 13.sp,
                      color: appColors.primaryColor,
                    ),
                    TextWidgets.subHeading2(
                      "EGP ${(cartItemEntity.productsEntity.price * cartItemEntity.count).toInt()}",
                      color: appColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                CartButtonDelete(
                  onDelete: () {
                    final cubit = context.read<CartItemCubit>();
                    showDialog(
                      context: context,
                      builder: (context) => CustomConfirmationDialog(
                        title: AppStrings.removeItem,
                        content: AppStrings.removeThisItem,
                        confirmText: AppStrings.remove,
                        onConfirm: () {
                          cubit.removeCartItem(cartItemEntity);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
