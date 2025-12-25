import 'package:flutter/material.dart';
import 'cart_empty_bag.dart';

class CartEmptyBagBody extends StatelessWidget {
  const CartEmptyBagBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CartEmptyBag(
      isCart: true,
      title: "Your Shopping cart looks empty.",
      subTitle: "what are you waiting for !!!",
      buttonTitle: "Shop Now",
    );
  }
}
