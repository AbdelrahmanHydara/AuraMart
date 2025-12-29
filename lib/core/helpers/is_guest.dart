import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/routing/routes.dart';
import 'package:shopx/core/theme/app_colors.dart';

bool get isGuest => FirebaseAuth.instance.currentUser == null;

void showLoginRequiredDialog(BuildContext context) {
  final appColors = Theme.of(context).extension<AppColors>()!;

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: appColors.secondaryColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            CupertinoIcons.lock_shield,
            size: 64.sp,
            color: goldenColor,
          ),
          verticalSpace(16),
          TextWidgets.subHeading(
            AppStrings.loginRequired,
            fontWeight: FontWeight.w600,
            color: appColors.primaryColor,
          ),
          verticalSpace(10),
          TextWidgets.bodyText1(
            AppStrings.signInToAddItems,
            textAlign: TextAlign.center,
            color: appColors.primaryColor.withAlpha(200),
          ),
          verticalSpace(24),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: CupertinoButton(
              borderRadius: BorderRadius.circular(12.r),
              color: goldenColor,
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.loginScreen);
              },
              child: TextWidgets.subHeading(
                AppStrings.login,
                fontWeight: FontWeight.w600,
                color: whiteColor,
              ),
            ),
          ),
          verticalSpace(8),
        ],
      ),
    ),
  );
}
