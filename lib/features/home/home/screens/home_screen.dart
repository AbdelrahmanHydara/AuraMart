import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/repos/products/products_repo.dart';
import 'package:shopx/core/services/get_it_services.dart';
import 'package:shopx/features/home/best_selling/cubit/best_selling_products_cubit.dart';
import 'package:shopx/features/home/latest_products/cubit/latest_products_cubit.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final productsRepo = getIt.get<ProductsRepo>();
    return MultiBlocProvider(
      providers: [
        BlocProvider<BestSellingProductsCubit>(
          create: (context) =>
              BestSellingProductsCubit(productsRepo: productsRepo)
                ..fetchBestSellingProducts(),
        ),
        BlocProvider<LatestProductsCubit>(
          create: (context) =>
          LatestProductsCubit(productsRepo: productsRepo)
                ..fetchLatestProducts(),
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
