import 'package:flutter/material.dart';
import 'package:shopx/core/components/custom_app_bar.dart';
import 'widgets/category_products_body_screen.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: categoryName, isCart: false),
      body: CategoryProductsBodyScreen(),
    );
  }
}
