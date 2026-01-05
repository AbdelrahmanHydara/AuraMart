import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/cubits/get_all_products/get_all_products_cubit.dart';
import 'package:shopx/core/helpers/get_dummy_product.dart';
import 'package:shopx/core/helpers/show_top_message.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'home_get_all_products.dart';

class HomeGetAllProductsBlocBuilder extends StatelessWidget {
  const HomeGetAllProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
      builder: (context, state) {
        if (state is GetAllProductsSuccess) {
          return HomeGetAllProducts(products: state.products);
        }
        if (state is GetAllProductsError) {
          showTopMessage(
            context: context,
            message: state.message,
            isError: true,
          );
        }
        return Skeletonizer(
          enabled: true,
          enableSwitchAnimation: true,
          child: HomeGetAllProducts(products: getDummyProductsList(6)),
        );
      },
    );
  }
}
