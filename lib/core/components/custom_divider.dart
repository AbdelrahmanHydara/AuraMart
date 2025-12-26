import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/theme/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.thickness = 1, this.padding});

  final double thickness;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20.w),
      child: Divider(
        color: appColors.primaryColor.withAlpha(100),
        thickness: thickness,
      ),
    );
  }
}
