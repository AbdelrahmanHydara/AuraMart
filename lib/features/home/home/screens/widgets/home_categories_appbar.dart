import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_container.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/constants/categories_constants.dart';

class HomeCategoriesAppBar extends StatelessWidget {
  const HomeCategoriesAppBar({super.key,});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          CategoriesConstants.categoriesList.length,
              (index) => GestureDetector(
                // onTap: () => Navigator.pushNamed(
                //   context,
                //   // CategoryItems.routName,
                //   arguments: text,
                // ),
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
                      CategoriesConstants.categoriesList[index].name,
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