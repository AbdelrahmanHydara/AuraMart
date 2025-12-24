import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  final List<String> _categories = [
    "Games",
    "Phones",
    "AirPods",
    "Laptops",
    "Cameras",
    "Watches",
    "Clothes",
    "Accessories",
    "Tools",
    "Drones",
  ];
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _categories.length;
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
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: appColors.searchColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: appColors.primaryColor.withAlpha(35)),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 12, right: 8),
              child: Icon(CupertinoIcons.search, size: 18),
            ),
            Text(
              "Search for ${_categories[_currentIndex]}",
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
