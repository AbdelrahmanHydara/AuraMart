import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'package:shopx/features/home/screens/widgets/product_card.dart';

class HomeGetAllProducts extends StatelessWidget {
  const HomeGetAllProducts({
    super.key, required this.products,
  });

  final List<ProductsEntity> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: greenColor.withAlpha(450),
      child: Column(
        children: [
          Image.asset("assets/images/banners/banner4.gif"),
          verticalSpace(10),
          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              horizontal: 10.h,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 0,
              childAspectRatio: 0.70,
            ),
            itemBuilder: (context , index) => ProductCard(
              width: 200,
              product: products[index],
            ),
          ),
        ],
      ),
    );
  }
}
