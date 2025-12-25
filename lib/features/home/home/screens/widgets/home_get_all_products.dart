import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/features/home/home/screens/widgets/product_card.dart';
import 'package:shopx/generated/assets.dart';

class HomeGetAllProducts extends StatelessWidget {
  const HomeGetAllProducts({
    super.key, required this.products,
  });

  final List<ProductsEntity> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.withAlpha(70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            Assets.bannersBanner,
          ),
          verticalSpace(16),
          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              horizontal: 10.h,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 10,
              childAspectRatio: 0.69,
            ),
            itemBuilder: (context , index) => ProductCard(
              width: 210,
              colorDiscount: Colors.green.shade500,
              product: products[index],
            ),
          ),
        ],
      ),
    );
  }
}
