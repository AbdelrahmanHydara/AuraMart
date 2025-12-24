import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/features/home/home/screens/widgets/product_card.dart';

class HomeBestSeller extends StatelessWidget {
  const HomeBestSeller({
    super.key, required this.products,
  });

  final List<ProductsEntity> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.h,
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      color: Colors.amber.withAlpha(450),
      child: SingleChildScrollView(
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
                product: products[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
