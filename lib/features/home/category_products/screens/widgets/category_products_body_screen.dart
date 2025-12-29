import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_container.dart';
import 'package:shopx/core/cubits/get_all_products/get_all_products_cubit.dart';
import 'package:shopx/core/helpers/get_category_color.dart';
import 'package:shopx/core/helpers/get_dummy_product.dart';
import 'package:shopx/features/home/home/screens/widgets/product_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryProductsBodyScreen extends StatelessWidget {
  const CategoryProductsBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
      builder: (context, state) {
        if (state is GetAllProductsError) {
          return Center(child: Text(state.message));
        }
        if (state is GetAllProductsSuccess) {
          final String categoryName = state.products.isNotEmpty
              ? state.products.first.category : "";
          final Color categoryColor = getCategoryColor(categoryName);
          return CustomContainer(
            color: categoryColor.withAlpha(20),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.products.length,
              padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 100.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15.h,
                crossAxisSpacing: 12.w,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  colorDiscount: categoryColor,
                  product: state.products[index],
                );
              },
            ),
          );
        }
        return Skeletonizer(
          enabled: true,
          enableSwitchAnimation: true,
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 12,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) =>
                ProductCard(product: getDummyProductsList(6)[index]),
          ),
        );
      },
    );
  }
}
