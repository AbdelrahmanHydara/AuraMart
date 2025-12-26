import 'package:flutter/material.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'cart_empty_bag.dart';

class CartEmptyBagBody extends StatelessWidget {
  const CartEmptyBagBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CartEmptyBag(
      isCart: true,
      title: AppStrings.cartEmpty,
      subTitle: AppStrings.waitingFor,
      buttonTitle: AppStrings.shopNow,
    );
  }
}
