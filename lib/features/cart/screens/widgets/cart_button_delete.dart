import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_container.dart';
import 'package:shopx/core/theme/app_colors.dart';

class CartButtonDelete extends StatelessWidget {
  const CartButtonDelete({
    super.key,
    this.onDelete,
  });

  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: 34.w,
      height: 34.h,
      radius: 10.r,
      color: blueColor,
      child: IconButton(
        onPressed: onDelete,
        icon: Icon(
          CupertinoIcons.delete,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}
