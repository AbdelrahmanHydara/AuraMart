import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_glass_nav_bar.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'package:shopx/features/cart/cubit/cart_item_cubit.dart';

BottomNavItemData buildBottomNavItemDataItem({
  required int index,
  required IconData icon,
  required IconData filledIcon,
  required String label,
  required AppColors appColors,
  required List<AnimationController> iconControllers,
}) {
  return BottomNavItemData(
    label: label,
    icon: AnimatedBuilder(
      animation: iconControllers[index],
      builder: (context, child) {
        double value = iconControllers[index].value;
        Color startColor = (index == 2)
            ? Colors.red.withAlpha(140)
            : appColors.primaryColor.withAlpha(140);

        Color endColor = (index == 2)
            ? Colors.red
            : appColors.primaryColor;

        Widget iconWidget = Transform.scale(
          scale: 1.0 + (value * 0.15),
          child: Icon(
            value > 0.5 ? filledIcon : icon,
            color: Color.lerp(startColor, endColor, value),
            size: 16.sp,
          ),
        );
        if (index == 3) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              iconWidget,
              Positioned(
                right: -6.w,
                top: -10.h,
                child: BlocBuilder<CartItemCubit, CartItemState>(
                  builder: (context, state) {
                    final count = context.read<CartItemCubit>().cartEntity.cartItems.length;
                    if (count == 0) return const SizedBox.shrink();
                    return Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: BoxConstraints(
                        minWidth: 12.w,
                        minHeight: 12.w,
                      ),
                      child: Text(
                        '$count',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        return iconWidget;
      },
    ),
  );
}