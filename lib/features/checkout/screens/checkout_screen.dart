import 'package:flutter/material.dart';
import 'package:shopx/core/components/custom_app_bar.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'widgets/checkout_body_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: AppStrings.checkoutTitle, isDelete: true),
      body: CheckoutBodyScreen(),
    );
  }
}
