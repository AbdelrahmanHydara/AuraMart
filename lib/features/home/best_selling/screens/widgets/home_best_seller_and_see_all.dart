import 'package:flutter/material.dart';
import 'package:shopx/core/components/custom_see_all.dart';
import 'package:shopx/core/helpers/extensions.dart';
import 'package:shopx/core/routing/routes.dart';

class HomeBestSellerAndSeeAll extends StatelessWidget {
  const HomeBestSellerAndSeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSeeAll(
      text: "Best Seller",
      onTap: () => context.pushNamed(Routes.bestSellingScreen),
    );
  }
}
