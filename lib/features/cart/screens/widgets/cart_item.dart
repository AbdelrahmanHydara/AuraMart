import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_avif_image.dart';
import 'package:shopx/core/components/custom_card_details.dart';
import 'package:shopx/core/components/custom_confirmation_dialog.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/features/cart/cubit/cart_item_cubit.dart';
import 'package:shopx/features/cart/entity/cart_item_entity.dart';
import 'cart_button_delete.dart';
import 'cart_item_action_buttons.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w, left: 12.w, top: 10.h),
      child: Row(
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
                  top: 2,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff05AF6F),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextWidgets.bodyText1(
                      "${cartItemEntity.productsEntity.discount}% discount",
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          horizontalSpace(10),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 10.h, horizontal: 5.w),
              child: Column(
                children: [
                  CustomCardDetails(
                    name: cartItemEntity.productsEntity.name,
                    quantity: cartItemEntity.productsEntity.quantity,
                    oldPrice: cartItemEntity.productsEntity.oldPrice,
                    price: cartItemEntity.productsEntity.price,
                  ),

                  verticalSpace(10),
                  Row(
                    children: [
                      CartItemActionButtons(cartItemEntity: cartItemEntity),
                      const Spacer(),
                      CartButtonDelete(
                        onDelete: () {
                          final cunit = context.read<CartItemCubit>();
                          showDialog(
                            context: context,
                            builder: (context) => CustomConfirmationDialog(
                              title: AppStrings.removeItem,
                              content: 'Do you want to remove this item from the cart ?',
                              confirmText: AppStrings.remove,
                              onConfirm: () {
                                cunit.removeCartItem(cartItemEntity);
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
