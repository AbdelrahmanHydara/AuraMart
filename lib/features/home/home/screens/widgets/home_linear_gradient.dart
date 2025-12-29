import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'home_banner_slider.dart';
import 'home_category_rounded.dart';

class HomeLinearGradient extends StatefulWidget {
  const HomeLinearGradient({super.key});

  @override
  State<HomeLinearGradient> createState() => _HomeLinearGradientState();
}

class _HomeLinearGradientState extends State<HomeLinearGradient> {
  bool _enabled = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _enabled = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.r),
          bottomLeft: Radius.circular(20.r),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF333030), Color(0xFF484545), Color(0xFFE0AD45)],
        ),
      ),
      child: Skeletonizer(
        enabled: _enabled,
        child: Column(
          children: [
            verticalSpace(16),
            const HomeBannerSlider(),
            verticalSpace(18),
            const HomeCategoryRoundedWidget(),
          ],
        ),
      ),
    );
  }
}
