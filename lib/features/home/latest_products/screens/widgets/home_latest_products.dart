import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/features/home/home/screens/widgets/product_card.dart';
import 'package:shopx/generated/assets.dart';

import 'home_latest_products_and_see_all.dart';

class HomeLatestProducts extends StatelessWidget {
  const HomeLatestProducts({
    super.key, required this.products,
  });

  final List<ProductsEntity> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Assets.bannersBanner4),
        Container(
          height: 325.h,
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          color: Colors.purple.withAlpha(100),
          child: Column(
            children: [
              const HomeLatestProductsAndSeeAll(),
              verticalSpace(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                  ),
                  child: Row(
                    children: List.generate(
                      products.length,
                          (index) => ProductCard(
                            height: 265,
                            width: 150,
                            colorDiscount: Colors.purple.shade500,
                            product: products[index],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
