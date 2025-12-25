import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'package:shopx/core/theme/app_text_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    this.onClear,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return Container(
      height: 38.h,
      padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 7.h,
      ),
      decoration: BoxDecoration(
        color: appColors.searchColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: appColors.primaryColor.withAlpha(35),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12, right: 8),
            child: Icon(
              CupertinoIcons.search,
              size: 18,
              color: appColors.primaryColor,
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: AppTextStyles.regular14,
              decoration: InputDecoration(
                hintText: "Search for products ...",
                hintStyle: AppTextStyles.regular14.copyWith(
                  color: appColors.primaryColor.withAlpha(100),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          if (controller.text.isNotEmpty)
            GestureDetector(
              onTap: onClear,
              child: Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: Icon(
                  CupertinoIcons.clear_circled_solid,
                  size: 18,
                  color: appColors.primaryColor.withAlpha(120),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
