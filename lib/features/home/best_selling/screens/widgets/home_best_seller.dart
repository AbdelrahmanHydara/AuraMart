import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/features/home/home/screens/widgets/product_card.dart';
import 'home_best_seller_and_see_all.dart';

class HomeBestSeller extends StatefulWidget {
  const HomeBestSeller({super.key, required this.products});

  final List<ProductsEntity> products;

  @override
  State<HomeBestSeller> createState() => _HomeBestSellerState();
}

class _HomeBestSellerState extends State<HomeBestSeller> {
  late Timer _timer;
  bool isStopTimer = true;
  int _colorIndex = 0;
  Color _backgroundColor = Colors.green.shade100;
  final List<Color> _colors = [
    Colors.amber.shade100,
    Colors.yellow.shade100,
    Colors.orange.shade100,
  ];

  @override
  void initState() {
    super.initState();
    _startColorSwitching();
  }

  void _startColorSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        _colorIndex = (_colorIndex + 1) % _colors.length;
        _backgroundColor = _colors[_colorIndex];
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      color: _backgroundColor,
      child: Column(
        children: [
          const HomeBestSellerAndSeeAll(),
          verticalSpace(10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: List.generate(
                  widget.products.length,
                  (index) => ProductCard(
                    height: 240,
                    width: 160,
                    colorDiscount: Colors.orange,
                    product: widget.products[index],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
