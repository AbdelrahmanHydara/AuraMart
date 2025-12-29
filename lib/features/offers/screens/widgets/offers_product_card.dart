import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_avif_image.dart';
import 'package:shopx/core/components/custom_container.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'package:shopx/features/home/home/screens/widgets/add_to_cart_bloc_builder.dart';

import '../../../../core/helpers/get_category_color.dart';

class OfferProductCard extends StatelessWidget {
  const OfferProductCard({
    super.key,
    required this.product,
    this.height = 280,
    this.width = 180,
    this.showFavorite = true,
    this.showAddToCart = true,
    this.showRating = true,
    this.showDiscount = true,
    this.onTap,
    this.onFavoriteTap,
    this.colorDiscount,
  });

  final ProductsEntity product;
  final double width, height;
  final bool showFavorite, showAddToCart, showRating, showDiscount;
  final Color? colorDiscount;
  final VoidCallback? onTap, onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(15),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: CustomContainer(
                    color: whiteColor,
                    width: double.infinity,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.r),
                      topLeft: Radius.circular(12.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: CustomAvifImage(
                          imageUrl: product.imageUrl ?? "",
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidgets.bodyText1(
                          product.name,
                          maxLines: 2,
                          fontSize: 13.sp,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            TextWidgets.subHeading2(
                              "EGP ${product.price}",
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        if (product.oldPrice != null && product.oldPrice! > product.price)
                          TextWidgets.bodyText(
                            "EGP ${product.oldPrice}",
                            decorationColor: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        verticalSpace(4),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (showDiscount && product.discount != 0)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: getCategoryColor(product.category),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(12.r)),
                  ),
                  child: Text(
                    "Offer ${product.discount}%",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            if (showFavorite)
              Positioned(
                top: 8,
                right: 8,
                child:GestureDetector(
                  onTap: onFavoriteTap,
                  child:  Icon(
                    CupertinoIcons.suit_heart,
                    size: 22.sp,
                    color: Colors.red,
                  ),
                ),
              ),
            if (showAddToCart)
              Positioned(
                bottom: 8,
                right: 8,
                child: AddToCartBlocBuilder(product: product),
              ),
          ],
        ),
      ),
    );
  }
}