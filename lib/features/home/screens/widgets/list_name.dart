import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';

class ListName extends StatelessWidget {
  const ListName({super.key, required this.text});
  final String text;

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
              fontWeight: FontWeight.w600,
              color: appColors.primaryColor,
          ),
          const Spacer(),
          TextWidgets.bodyText3(
              "See all",
              fontSize: 12.sp,
              color: Colors.green.shade800,
              fontWeight: FontWeight.w900,
          ),
          horizontalSpace(5),
        ],
      ),
    );
  }
}