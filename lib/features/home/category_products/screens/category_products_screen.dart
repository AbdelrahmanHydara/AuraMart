import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/components/custom_app_bar.dart';
import 'package:shopx/core/cubits/get_all_products/get_all_products_cubit.dart';
import 'package:shopx/core/repos/products/products_repo.dart';
import 'package:shopx/core/services/get_it_services.dart';
import 'widgets/category_products_body_screen.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetAllProductsCubit(productsRepo: getIt.get<ProductsRepo>())
            ..fetchProductsByCategory(categoryName: categoryName),
      child: Scaffold(
        appBar: CustomAppBar(text: categoryName, isCart: false),
        body: CategoryProductsBodyScreen(),
      ),
    );
  }
}
