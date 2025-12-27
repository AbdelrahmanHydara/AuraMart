import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';

class CustomSeeAll extends StatelessWidget {
  const CustomSeeAll({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10.w,
      ),
      child: Row(
        children: [
          TextWidgets.bodyText1(text,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: appColors.primaryColor,
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: TextWidgets.bodyText3(
              AppStrings.seeAll,
                fontSize: 13.sp,
                color: blueColor,
                fontWeight: FontWeight.w900,
            ),
          ),
          horizontalSpace(5),
        ],
      ),
    );
  }
}