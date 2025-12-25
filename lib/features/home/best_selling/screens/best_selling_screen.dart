import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/components/custom_app_bar.dart';
import 'package:shopx/core/helpers/get_dummy_product.dart';
import 'package:shopx/core/repos/products/products_repo.dart';
import 'package:shopx/core/services/get_it_services.dart';
import 'package:shopx/features/home/best_selling/cubit/best_selling_products_cubit.dart';
import 'package:shopx/features/home/best_selling/screens/widgets/best_selling_body_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingScreen extends StatelessWidget {
  const BestSellingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onDelete: () {}, text: 'Best Seller',),
      body: BlocProvider(
        create: (context) =>
        BestSellingProductsCubit(
            productsRepo: getIt.get<ProductsRepo>())..fetchBestSellingProducts(),
        child: BlocConsumer<BestSellingProductsCubit, BestSellingProductsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is BestSellingProductsSuccess) {
              return BestSellingBodyScreen(
                products: state.products,
              );
            }
            if (state is BestSellingProductsLoading) {
              return Skeletonizer(
                enabled: true,
                enableSwitchAnimation: true,
                child: BestSellingBodyScreen(
                  products: getDummyProductsList(6),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
