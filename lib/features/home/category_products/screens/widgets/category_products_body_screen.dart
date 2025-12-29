import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_container.dart';
import 'package:shopx/core/cubits/get_all_products/get_all_products_cubit.dart';
import 'package:shopx/core/helpers/get_dummy_product.dart';
import 'package:shopx/core/helpers/show_app_toast.dart';
import 'package:shopx/features/home/home/screens/widgets/home_get_all_products.dart';
import 'package:shopx/features/home/home/screens/widgets/product_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryProductsBodyScreen extends StatelessWidget {
  const CategoryProductsBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
      builder: (context, state) {
        if (state is GetAllProductsError) {
          showAppToast(message: state.message, bgColor: Colors.red);
        } else if (state is GetAllProductsSuccess) {
          return CustomContainer(
            color: Colors.purple.withAlpha(50),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.products.length,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 10,
                childAspectRatio: 0.69,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  width: 210,
                  height: 280,
                  colorDiscount: Colors.purple.shade500,
                  product: state.products[index],
                );
              },
            ),
          );
        }
        {
          return Skeletonizer(
            enabled: true,
            enableSwitchAnimation: true,
            child: HomeGetAllProducts(products: getDummyProductsList(2)),
          );
        }
      },
    );
  }
}
