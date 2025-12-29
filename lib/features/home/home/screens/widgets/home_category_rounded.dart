import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/constants/app_categories_sections.dart';
import 'package:shopx/core/cubits/get_all_products/get_all_products_cubit.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'package:shopx/features/home/category_products/screens/category_products_screen.dart';

class HomeCategoryRoundedWidget extends StatelessWidget {
  const HomeCategoryRoundedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return SizedBox(
      height: 105.h,
      child: CarouselSlider.builder(
        itemCount: AppCategoriesSections.categoriesList.length,
        disableGesture: true,
        options: CarouselOptions(
          height: 85.h,
          viewportFraction: 0.18.w,
          autoPlay: true,
          enlargeCenterPage: false,
          pageSnapping: true,
          autoPlayCurve: Curves.easeIn,
          enableInfiniteScroll: true,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          autoPlayAnimationDuration: const Duration(milliseconds: 500),
        ),
        itemBuilder: (BuildContext context, int index, int pageViewIndex) {
          return GestureDetector(
            onTap: () {
              context.read<GetAllProductsCubit>().fetchProductsByCategory(
                categoryName: AppCategoriesSections.categoriesList[index].name,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryProductsScreen(
                    categoryName: AppCategoriesSections.categoriesList[index].name,
                  ),
                ),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Container(
                    width: 55.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(300.r),
                      child: Image.asset(
                        AppCategoriesSections.categoriesList[index].image,
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
    );
  }
}
