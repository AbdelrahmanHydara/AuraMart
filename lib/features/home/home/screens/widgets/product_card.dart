import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_avif_image.dart';
import 'package:shopx/core/components/custom_card_details.dart';
import 'package:shopx/core/components/custom_container.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'add_to_cart_bloc_builder.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.height = 255,
    this.width = 165,
    this.showFavorite = true,
    this.showAddToCart = true,
    this.showRating = true,
    this.showDiscount = true,
    this.onTap,
    this.onFavoriteTap,
    this.onAddToCart,
    this.colorDiscount,
  });

  final ProductsEntity product;
  final double width, height;
  final bool showFavorite;
  final bool showAddToCart;
  final bool showRating;
  final bool showDiscount;
  final Color? colorDiscount;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onAddToCart;

  double get averageRating {
    if (product.reviews.isEmpty) return 0;
    final total = product.reviews.fold<int>(
      0,
      (sum, review) => sum + review.rating,
    );
    return total / product.reviews.length;
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Card(
            elevation: 4,
            shadowColor: Colors.grey.shade900,
            color: appColors.secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: SizedBox(
              width: width.w,
              height: height.h,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
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
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: CustomCardDetails(
                        name: product.name,
                        price: product.price,
                        oldPrice: product.oldPrice,
                        quantity: product.quantity,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (showDiscount && product.discount != 0)
            Positioned(
              top: 10,
              left: 8,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: colorDiscount ?? Colors.red,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: TextWidgets.bodyText1(
                  "${product.discount}% Discount",
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  color: whiteColor,
                ),
              ),
            ),
          if (showFavorite)
            Positioned(
              top: 8.h,
              right: 16.w,
              child: GestureDetector(
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
          if (showRating && averageRating > 0)
          Positioned(
            top: 140,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black12.withAlpha(100),
                borderRadius: BorderRadius.circular(20),
              ),
              child:  Row(
                children: [
                  Icon(CupertinoIcons.star_fill,size: 12,color: Colors.yellow.shade700),
                  horizontalSpace(5),
                  TextWidgets.bodyText1(
                    "",
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
