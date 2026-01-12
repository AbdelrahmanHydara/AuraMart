import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_avif_image.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/routing/routes.dart';
import 'package:shopx/core/theme/app_colors.dart';

class SearchViewProducts extends StatelessWidget {
  const SearchViewProducts({super.key, required this.productsEntity});

  final ProductsEntity productsEntity;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return GestureDetector(
      onTap: () async {
        await Navigator.pushNamed(
          context,
          Routes.productDetailsScreen,
          arguments: productsEntity.code,
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            Container(
              color: whiteColor,
              height: 80.h,
              width: 80.w,
              child: CustomAvifImage(
                imageUrl: productsEntity.imageUrl ?? "",
              ),
            ),
            horizontalSpace(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidgets.bodyText(
                    productsEntity.name,
                    color: appColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(4),
                  Row(
                    children: [
                      TextWidgets.bodyText1(
                        productsEntity.category,
                        color: appColors.primaryColor.withAlpha(255),
                        fontSize: 12.sp,
                      ),
                      horizontalSpace(16),
                      TextWidgets.bodyText(
                        "EGP ${productsEntity.price}",
                        color: appColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            horizontalSpace(20),
            const Icon(
              CupertinoIcons.arrow_right_circle,
              color: Colors.grey,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}