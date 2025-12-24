import 'package:flutter/material.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/features/home/screens/widgets/home_banner_slider.dart';
import 'package:shopx/features/home/screens/widgets/home_category_rounded.dart';
import 'home_best_seller_and_see_all.dart';
import 'home_best_seller_bloc_builder.dart';
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
          verticalSpace(30),
          const HomeCategoryRoundedWidget(),
          verticalSpace(35),
          const HomeBestSellerAndSeeAll(),
          verticalSpace(30),
          const HomeBestSellerBlocBuilder(),
          verticalSpace(30),
          const HomeGetAllProductsBlocBuilder(),
        ],
      ),
    );
  }
}


