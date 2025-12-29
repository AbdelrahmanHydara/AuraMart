import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/constants/app_categories_sections.dart';
import 'package:shopx/core/helpers/extensions.dart';
import 'package:shopx/core/routing/routes.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'package:shopx/core/theme/app_text_styles.dart';

class HomeSearchAppBar extends StatefulWidget {
  const HomeSearchAppBar({super.key});

  @override
  State<HomeSearchAppBar> createState() => _HomeSearchAppBarState();
}

class _HomeSearchAppBarState extends State<HomeSearchAppBar> {
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) {
        setState(() {
          _currentIndex =
              (_currentIndex + 1) %
              AppCategoriesSections.categoriesList[_currentIndex].name.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.searchScreen),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: appColors.searchColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: appColors.primaryColor.withAlpha(35)),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12.w, right: 8.w),
              child: Icon(CupertinoIcons.search, size: 16.sp),
            ),
            Text(
              "Search for ${AppCategoriesSections.categoriesList[_currentIndex].name}",
              style: AppTextStyles.regular14.copyWith(
                color: appColors.primaryColor.withAlpha(100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
