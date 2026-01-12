import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'search_view_products.dart';

class SearchSuccessResult extends StatelessWidget {
  final List<ProductsEntity> results;
  const SearchSuccessResult({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 20.h),
      itemCount: results.length,
      separatorBuilder: (context, index) =>
          const Divider(thickness: 1, height: 30),
      itemBuilder: (context, index) =>
          SearchViewProducts(productsEntity: results[index]),
    );
  }
}
