import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/cubits/best_seller_products/best_selling_products_cubit.dart';
import 'package:shopx/core/cubits/get_all_products/get_all_products_cubit.dart';
import 'package:shopx/core/repos/products/products_repo.dart';
import 'package:shopx/core/services/get_it_services.dart';
import 'package:shopx/features/home/screens/widgets/home_appbar.dart';
import 'widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsRepo = getIt.get<ProductsRepo>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<GetAllProductsCubit>(
          create: (context) =>
              GetAllProductsCubit(productsRepo: productsRepo)
                ..fetchAllProducts(),
        ),
        BlocProvider<BestSellingProductsCubit>(
          create: (context) =>
              BestSellingProductsCubit(productsRepo: productsRepo)
                ..fetchBestSellingProducts(),
        ),
      ],
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const HomeAppBar(),
        body: const HomeScreenBody(),
      ),
    );
  }
}
