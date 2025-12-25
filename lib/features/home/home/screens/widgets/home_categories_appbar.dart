import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_container.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/constants/app_categories_sections.dart';
import 'package:shopx/core/routing/routes.dart';

class HomeCategoriesAppBar extends StatelessWidget {
  const HomeCategoriesAppBar({super.key,});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          AppCategoriesSections.categoriesList.length,
              (index) => GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  Routes.searchScreen,
                  arguments: AppCategoriesSections.categoriesList[index].name,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                  ),
                  child: CustomContainer(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    radius: 30.r,
                    color: Colors.grey.withAlpha(25),
                    child: TextWidgets.bodyText(
                      AppCategoriesSections.categoriesList[index].name,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
        ),
      ),
    );
  }
}