import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_container.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/helpers/extensions.dart';
import 'package:shopx/core/routing/routes.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'package:shopx/features/cart/cubit/cart_item_cubit.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key,});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 24.w,
      right: 24.w,
      bottom: 100.h,
      child: GestureDetector(
        onTap: () => context.pushNamed(Routes.checkoutScreen),
        child: CustomContainer(
          color: blueColor,
          height: 60.h,
          radius: 12.r,
          child: Stack(
            alignment: Alignment.center,
            children: [
              TextWidgets.subHeading(
                AppStrings.checkout,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidgets.subHeading2(
                          "${context.watch<CartItemCubit>().cartEntity.cartItems.length} items",
                          fontWeight: FontWeight.w400,
                        ),
                        TextWidgets.subHeading2(
                          "EGP ${context.watch<CartItemCubit>().cartEntity.calculateTotalPrice()}",
                        ),
                      ],
                    ),
                    const Icon(
                      CupertinoIcons.arrow_right_circle_fill,
                      color: whiteColor,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}