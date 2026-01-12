import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'search_view_products.dart';

class SearchLoadingView extends StatelessWidget {
  const SearchLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
      ),
      child: ListView.separated(
        padding: EdgeInsets.only(top: 20.h),
        itemCount: 4,
        separatorBuilder: (context, index) =>
            const Divider(thickness: 1, height: 30),
        itemBuilder: (context, index) {
          return SearchViewProducts(
            productsEntity: ProductsEntity(
              name: "Product Name Placeholder",
              category: "Category",
              code: "0",
              reviews: [],
              description: '',
              price: 222,
              quantity: 22,
              categoryId: '',
            ),
          );
        },
      ),
    );
  }
}
