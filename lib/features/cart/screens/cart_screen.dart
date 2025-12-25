import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/components/custom_app_bar.dart';
import 'package:shopx/core/components/custom_confirmation_dialog.dart';
import 'package:shopx/features/cart/cubit/cart_item_cubit.dart';
import 'widgets/cart_body_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(
        onDelete: () {
          final cubit = context.read<CartItemCubit>();

          showDialog(
            context: context,
            builder: (context) => CustomConfirmationDialog(
              title: 'Clear Cart',
              content:
                  'Are you sure you want to remove all items from your cart ?',
              confirmText: 'Clear All',
              onConfirm: () {
                cubit.clearAllCart();
              },
            ),
          );
        },
        isDelete: true,
        isCart: true,
        text: 'You Cart',
      ),
      body: const CartBodyScreen(),
    );
  }
}
