import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'custom_text.dart';

class CustomCardDetails extends StatelessWidget {
  const CustomCardDetails({
    super.key,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.quantity,
    this.maxLinesName,
  });

  final String name;
  final int? oldPrice, maxLinesName;
  final int price, quantity;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidgets.bodyText1(
          name,
          maxLines: maxLinesName ?? 2,
          fontSize: 13.sp,
          overflow: TextOverflow.ellipsis,
          color: appColors.primaryColor,
          fontWeight: FontWeight.w500,
        ),
        Row(
          children: [
            TextWidgets.bodyText1(
              "EGP $price",
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: appColors.primaryColor,
            ),
            if (oldPrice != 0) ...[
              horizontalSpace(8),
              TextWidgets.bodyText1(
                "EGP $oldPrice",
                color: Color(0xff05AF6F),
                decorationColor: Color(0xff05AF6F),
                decoration: TextDecoration.lineThrough,
              ),
            ],
          ],
        ),
        Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Icon(
              CupertinoIcons.cube_box,
              size: 12,
              color: appColors.primaryColor,
            ),
            horizontalSpace(4),
            TextWidgets.bodyText(
              quantity > 0 ? "Only $quantity left in Stock" : "Out of Stock",
              fontSize: 10.sp,
              color: quantity > 0 ? Color(0xff05AF6F) : Colors.red,
            ),
          ],
        ),
        verticalSpace(4),
      ],
    );
  }
}
