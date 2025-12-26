import 'package:flutter/material.dart';
import 'package:shopx/core/helpers/spacing.dart';

import 'home_banner_slider.dart';
import 'home_category_rounded.dart';

class HomeLinearGradient extends StatelessWidget {
  const HomeLinearGradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration (
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF333030),
            Color(0xFF484545),
            Color(0xFFE0AD45),
          ],
        ),
      ),
      child: Column(
        children: [
          verticalSpace(20),
          const HomeBannerSlider(),
          verticalSpace(20),
          const HomeCategoryRoundedWidget(),
        ],
      ),
    );
  }
}
