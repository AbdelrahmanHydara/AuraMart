import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/features/home/home/screens/widgets/product_card.dart';
import 'home_best_seller_and_see_all.dart';

class HomeBestSeller extends StatelessWidget {
  const HomeBestSeller({
    super.key, required this.products,
  });

  final List<ProductsEntity> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      color: Colors.amber.withAlpha(70),
      child: Column(
        children: [
          const HomeBestSellerAndSeeAll(),
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
                        height: 240,
                        width: 160,
                        colorDiscount: Colors.amber.shade700,
                        product: products[index],
                  ),
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
