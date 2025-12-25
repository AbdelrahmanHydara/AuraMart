import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/constants/app_categories_sections.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';

class HomeCategoryRoundedWidget extends StatelessWidget {
  const HomeCategoryRoundedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return SizedBox(
      height: 150.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: TextWidgets.heading(
              AppStrings.categories,
              fontSize: 20.sp,
              color: appColors.primaryColor,
            ),
          ),
          verticalSpace(16),
          CarouselSlider.builder(
            itemCount: AppCategoriesSections.categoriesList.length,
            disableGesture: true,
            options: CarouselOptions(
              height: 100.h,
              viewportFraction: 0.19,
              autoPlay: true,
              enlargeCenterPage: false,
              pageSnapping: true,
              autoPlayCurve: Curves.easeIn,
              enableInfiniteScroll: true,
              scrollPhysics: const NeverScrollableScrollPhysics(),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
            ),
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              return GestureDetector(
                // onTap: () => Navigator.pushNamed(
                //   context,
                //   CategoryItems.routName,
                //   arguments: name,
                // ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(300.r),
                          child: Image.asset(
                            AppCategoriesSections.categoriesList[index].image,
                            width: 60.w,
                            height: 60.h,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(15),
                    TextWidgets.bodyText1(
                      AppCategoriesSections.categoriesList[index].name,
                      fontSize: 12.sp,
                      color: appColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
