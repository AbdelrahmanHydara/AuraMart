import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_container.dart';
import 'package:shopx/core/theme/app_colors.dart';

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CustomContainer(
        width: 20.w,
        height: 20.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            100.r,
          ),
        ),
        child: FittedBox(
          child: Icon(
            icon,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}