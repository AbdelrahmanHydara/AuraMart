import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_container.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.width = 180,
    this.showFavorite = true,
    this.showAddToCart = true,
    this.showRating = true,
    this.showDiscount = true,
    this.onTap,
    this.onFavoriteTap,
    this.onAddToCart,
  });

  final ProductsEntity product;
  final double width;
  final bool showFavorite;
  final bool showAddToCart;
  final bool showRating;
  final bool showDiscount;
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
            elevation: 2,
            color: appColors.secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: SizedBox(
              width: width,
              child: Column(
                children: [
                  CustomContainer(
                    color: Colors.white,
                    width: double.infinity,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: FancyShimmerImage(
                        imageUrl: product.imageUrl ??
                            'https://via.placeholder.com/150',
                        height: 125.h,
                        width: 100.w,
                        boxFit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidgets.bodyText1(
                          product.name,
                          maxLines: 2,
                          fontSize: 13,
                          overflow: TextOverflow.ellipsis,
                          color: appColors.primaryColor,
                        ),
                        verticalSpace(8),
                        Row(
                          children: [
                            TextWidgets.bodyText1(
                              "EP ${product.price}",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: appColors.primaryColor,
                            ),
                            if (product.oldPrice != 0) ...[
                              horizontalSpace(8),
                              TextWidgets.bodyText1(
                                "EP ${product.oldPrice}",
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                              ),
                            ],
                          ],
                        ),
                        verticalSpace(6),
                        TextWidgets.bodyText1(
                          product.quantity > 0
                              ? "In Stock"
                              : "Out of Stock",
                          fontSize: 11,
                          color: product.quantity > 0
                              ? Colors.green
                              : Colors.red,
                        ),
                      ],
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
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextWidgets.bodyText1(
                  "${product.discount}%",
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          if (showFavorite)
            Positioned(
              top: 10,
              right: 6,
              child: InkWell(
                onTap: onFavoriteTap,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.favorite_border,
                      size: 18,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          if (showAddToCart)
            Positioned(
              bottom: 8,
              right: 8,
              child: InkWell(
                onTap: onAddToCart,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.add_shopping_cart, size: 18),
                  ),
                ),
              ),
            ),
          if (showRating && averageRating > 0)
            Positioned(
              bottom: 8,
              left: 8,
              child: Container(
                padding:
                EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star,
                        size: 12, color: Colors.amber),
                    horizontalSpace(4),
                    TextWidgets.bodyText1(
                      averageRating.toStringAsFixed(1),
                      fontSize: 10,
                      color: Colors.white,
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

