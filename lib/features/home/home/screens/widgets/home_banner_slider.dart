import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/constants/app_constants.dart';

class HomeBannerSlider extends StatelessWidget {
  const HomeBannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: CarouselSlider.builder(
        itemCount: AppConstants.bannerImages.length,
        options: CarouselOptions(
          height: 68.h,
          enlargeCenterPage: true,
          viewportFraction: 1,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 7),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
        ),
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                AppConstants.bannerImages[itemIndex],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
      ),
    );
  }
}
