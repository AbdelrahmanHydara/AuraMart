import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String text;
  final bool isCart;
  final bool isDelete;
  final void Function()? onDelete;

  const CustomAppBar({
    super.key,
    required this.text,
    this.onDelete,
    this.isCart = false,
    this.isDelete = false,
  }) : preferredSize = const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return AppBar(
      elevation: 1,
      leadingWidth: 0,
      centerTitle: true,
      leading: const SizedBox.shrink(),
      scrolledUnderElevation: 4,
      toolbarHeight: preferredSize.height,
      backgroundColor: appColors.secondaryColor.withAlpha(400),
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(color: Colors.transparent),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isCart
              ? Icon(CupertinoIcons.cart, color: appColors.primaryColor)
              : GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    CupertinoIcons.arrow_left_circle,
                    color: appColors.primaryColor,
                  ),
                ),
          TextWidgets.heading(text, color: appColors.primaryColor),
          isDelete
              ? GestureDetector(
                  onTap: onDelete,
                  child: Icon(
                    CupertinoIcons.delete,
                    color: appColors.primaryColor,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
