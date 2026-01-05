import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';

class HeadingAuth extends StatelessWidget {
  const HeadingAuth({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidgets.heading(
          AppStrings.welcomeBack,
          color: whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 38.sp,
        ),
        verticalSpace(6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidgets.subHeading(
              AppStrings.signInToApex,
              color: whiteColor.withAlpha(179),
              fontWeight: FontWeight.w500,
              fontSize: 10.sp,
            ),
            TextWidgets.subHeading(
              AppStrings.unlockTheFuture,
              color: whiteColor.withAlpha(160),
              fontWeight: FontWeight.w400,
              fontSize: 10.sp,
            ),
          ],
        ),
      ],
    );
  }
}
