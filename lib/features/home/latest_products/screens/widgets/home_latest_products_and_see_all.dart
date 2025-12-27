import 'package:flutter/material.dart';
import 'package:shopx/core/components/custom_see_all.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/helpers/extensions.dart';
import 'package:shopx/core/routing/routes.dart';

class HomeLatestProductsAndSeeAll extends StatelessWidget {
  const HomeLatestProductsAndSeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSeeAll(
      text: AppStrings.newArrivals,
      onTap: () => context.pushNamed(Routes.bestSellingScreen),
    );
  }
}
