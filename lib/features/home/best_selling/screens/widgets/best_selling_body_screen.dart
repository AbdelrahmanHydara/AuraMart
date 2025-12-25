import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopx/core/components/custom_search_bar.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'package:shopx/features/home/best_selling/cubit/best_selling_products_cubit.dart';
import 'package:shopx/features/home/home/screens/widgets/product_card.dart';

class BestSellingBodyScreen extends StatelessWidget {
  const BestSellingBodyScreen({super.key, required this.products});

  final List<ProductsEntity> products;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 30.h,
            ),
            child: Column(
              children: [
                CustomSearchBar(
                controller: context.read<BestSellingProductsCubit>().searchController,
                onChanged: (String value) {

                },
                ),
                verticalSpace(20.h),
                Row(
                  children: [
                    TextWidgets.heading(
                      'Best Selling Products',
                      color: appColors.primaryColor,
                    ),
                    const Spacer(),
                    SvgPicture.asset("assets/svg/filter.svg"),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            color: Colors.amber.withAlpha(450),
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 0,
                childAspectRatio: 0.70,
              ),
              itemBuilder: (context, index) =>
                  ProductCard(width: 200, product: products[index]),
            ),
          ),
        ],
      ),
    );
  }
}
