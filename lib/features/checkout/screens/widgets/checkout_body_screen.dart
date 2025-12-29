import 'package:flutter/material.dart';

class CheckoutBodyScreen extends StatelessWidget {
  const CheckoutBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This is the Checkout Body Screen',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
