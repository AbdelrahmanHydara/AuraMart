import 'package:flutter/material.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/features/home/best_selling/screens/widgets/home_best_seller_bloc_builder.dart';
import 'package:shopx/features/home/latest_products/screens/widgets/home_latest_products_bloc_builder.dart';
import 'home_banner_slider.dart';
import 'home_category_rounded.dart';
import 'home_get_all_products_bloc_builder.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          verticalSpace(198),
          const HomeBannerSlider(),
          verticalSpace(20),
          const HomeCategoryRoundedWidget(),
          verticalSpace(30),
          const HomeBestSellerBlocBuilder(),
          verticalSpace(30),
          const HomeLatestProductsBlocBuilder(),
          verticalSpace(30),
          const HomeGetAllProductsBlocBuilder(),
        ],
      ),
    );
  }
}


