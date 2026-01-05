import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/theme/app_colors.dart';

class CustomGlassContainerAuth extends StatelessWidget {
  const CustomGlassContainerAuth({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          decoration: BoxDecoration(
            color: whiteColor.withAlpha(30),
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(
              color: whiteColor.withAlpha(51),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
