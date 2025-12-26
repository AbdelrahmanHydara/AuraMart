import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'custom_text.dart';

class CustomCardDetails extends StatelessWidget {
  const CustomCardDetails({super.key, required this.name, required this.price, required this.oldPrice, required this.quantity, this.maxLinesName,});

  final String name;
  final int? oldPrice, maxLinesName;
  final int price, quantity;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgets.bodyText1(
          name,
          maxLines: maxLinesName ?? 1,
          fontSize: 14.sp,
          overflow: TextOverflow.ellipsis,
          color: appColors.primaryColor,
          fontWeight: FontWeight.w600,
        ),
        verticalSpace(8),
        Row(
          children: [
            TextWidgets.bodyText1(
              "EGP $price",
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: appColors.primaryColor,
            ),
            if (oldPrice != 0) ...[
              horizontalSpace(8),
              TextWidgets.bodyText1(
                "EGP $oldPrice",
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ],
          ],
        ),
        verticalSpace(16),
        Row(
          children: [
            TextWidgets.bodyText1(
              quantity > 0
                  ? "In Stock"
                  : "Out of Stock",
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: quantity > 0
                  ? Color(0xff05AF6F)
                  : Colors.red,
            ),
            horizontalSpace(5),
            TextWidgets.bodyText1(
              quantity > 0
                  ? "$quantity"
                  : "0",
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: quantity > 0
                  ? appColors.primaryColor
                  : Colors.red,
            ),
          ],
        ),
      ],
    );
  }
}
