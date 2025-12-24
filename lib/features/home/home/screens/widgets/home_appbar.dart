import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'package:shopx/features/home/home/screens/widgets/home_categories_appbar.dart';
import 'package:shopx/features/home/home/screens/widgets/home_search_appbar.dart';
import 'package:shopx/features/home/home/screens/widgets/home_top_appbar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const HomeAppBar({super.key}): preferredSize = const Size.fromHeight(160);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return AppBar(
      backgroundColor: appColors.secondaryColor.withAlpha(400),
      toolbarHeight: preferredSize.height.h,
      scrolledUnderElevation: 0,
      leadingWidth: 0,
      leading: const SizedBox.shrink(),
      flexibleSpace: _buildClipRect(),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeTopAppBar(),
          verticalSpace(12),
          const HomeSearchAppBar(),
          verticalSpace(16),
          const HomeCategoriesAppBar(),
        ],
      ),
    );
  }

  ClipRect _buildClipRect() {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: 12,
            sigmaY : 12,
        ),
        child: Container(
            color: Colors.transparent,
        ),
      ),
    );
  }
}


