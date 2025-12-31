import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_container.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/theme/app_colors.dart';

class AddNewAddressCard extends StatelessWidget {
  const AddNewAddressCard({super.key, required this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: CustomContainer(
          radius: 12,
          height: 50,
          borderColor: greenColor,
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: CustomContainer(
              radius: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add,
                    size: 20,
                    color: greenColor,
                  ),
                  // kGap10,
                  TextWidgets.subHeading(
                    "Add Address",
                    color: appColors.primaryColor,
                    fontSize: 13.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
