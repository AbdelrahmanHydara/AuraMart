import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/constants/app_constants.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeBannerSlider extends StatefulWidget {
  const HomeBannerSlider({super.key});

  @override
  State<HomeBannerSlider> createState() => _HomeBannerSliderState();
}

class _HomeBannerSliderState extends State<HomeBannerSlider> {

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
    return Skeletonizer(
      enabled: _enabled,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: CarouselSlider.builder(
          itemCount: AppConstants.bannerImages.length,
          options: CarouselOptions(
            height: 90.h,
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
      ),
    );
  }
}
