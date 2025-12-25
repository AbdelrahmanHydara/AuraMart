import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/helpers/get_dummy_product.dart';
import 'package:shopx/core/helpers/show_app_toast.dart';
import 'package:shopx/features/home/latest_products/cubit/latest_products_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'home_latest_products.dart';

class HomeLatestProductsBlocBuilder extends StatelessWidget {
  const HomeLatestProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LatestProductsCubit, LatestProductsState>(
      listener: (context, state) {
        if (state is LatestProductsError) {
          showAppToast(message: state.message, bgColor: Colors.red);
        }
      },
      builder: (context, state) {
        if (state is LatestProductsSuccess) {
          return HomeLatestProducts(products: state.products);
        }
        if (state is LatestProductsLoading) {
          return Skeletonizer(
            enabled: true,
            enableSwitchAnimation: true,
            child: HomeLatestProducts(products: getDummyProductsList(5)),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
