import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/helpers/get_dummy_product.dart';
import 'package:shopx/features/home/best_selling/cubit/best_selling_products_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'home_best_seller.dart';

class HomeBestSellerBlocBuilder extends StatelessWidget {
  const HomeBestSellerBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BestSellingProductsCubit, BestSellingProductsState>(
        listener: (context, state) {
          if (state is BestSellingProductsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is BestSellingProductsSuccess) {
            return HomeBestSeller(
              products: state.products,
            );
          }
          if (state is BestSellingProductsLoading) {
            return Skeletonizer(
              enabled: true,
              enableSwitchAnimation: true,
              child: HomeBestSeller(
                products: getDummyProductsList(5),
              ),
            );
          }
          return const SizedBox.shrink();
        }
    );
  }
}
