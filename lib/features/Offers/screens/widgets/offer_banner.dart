import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/constants/app_constants.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';

class OfferBanner extends StatelessWidget {
  const OfferBanner({super.key, required this.duration});

  final Duration duration;
  String _formatNumber(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final hours = _formatNumber(duration.inHours);
    final minutes = _formatNumber(duration.inMinutes.remainder(60));
    final seconds = _formatNumber(duration.inSeconds.remainder(60));
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.flash_on, color: Colors.yellow, size: 18.sp),
                  horizontalSpace(5),
                  TextWidgets.subHeading2(
                    AppStrings.flashSALE,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ],
              ),
              Row(
                children: [
                  TextWidgets.bodyText(
                    AppStrings.endsIn,
                    color: Colors.grey,
                  ),
                  horizontalSpace(5),
                  _buildTimeBox(hours),
                  _buildDivider(),
                  _buildTimeBox(minutes),
                  _buildDivider(),
                  _buildTimeBox(seconds),
                ],
              ),
            ],
          ),
        ),
        verticalSpace(10),
        CarouselSlider.builder(
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
          itemBuilder: (context, index, realIndex) => Image.asset(
            AppConstants.bannerImages[index],
            fit: BoxFit.contain,
            width: double.infinity,
          ),
        ),
      ],
    );
  }

  Widget _buildTimeBox(String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        value,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 13.sp,
        ),
      ),
    );
  }

  Widget _buildDivider() => Text(
    "  :  ",
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  );
}
