import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/cubits/get_all_products/get_all_products_cubit.dart';
import 'package:shopx/core/helpers/get_dummy_product.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'offers_product_card.dart';

class OffersBodyScreen extends StatelessWidget {
  const OffersBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
      builder: (context, state) {
        final bool isLoading = state is! GetAllProductsSuccess;
        final offers = isLoading
            ? getDummyProductsList(6)
            : state.products.where((p) => (p.discount ?? 0) > 0).toList();
        if (!isLoading && offers.isEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.local_offer_outlined, size: 64.sp, color: Colors.grey),
                  verticalSpace(16),
                  TextWidgets.heading(AppStrings.noOffers, color: Colors.grey),
                ],
              ),
            ),
          );
        }
        return Skeletonizer.sliver(
          enabled: isLoading,
          child: SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 14.w,
                childAspectRatio: 0.62,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return OfferProductCard(product: offers[index]);
                },
                childCount: offers.length,
              ),
            ),
          ),
        );
      },
    );
  }
}