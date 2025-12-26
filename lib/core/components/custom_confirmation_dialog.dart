import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';

class CustomConfirmationDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final void Function() onConfirm;

  const CustomConfirmationDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    this.confirmText = 'Confirm',
  });

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return Dialog(
      backgroundColor: appColors.secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextWidgets.subHeading2(
              title,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              color: appColors.primaryColor,
            ),
            verticalSpace(12),
            TextWidgets.bodyText1(
              content,
              textAlign: TextAlign.center,
              color: appColors.primaryColor.withAlpha(180),
            ),
            verticalSpace(20),
            Divider(
              height: 1,
              color: appColors.primaryColor.withAlpha(100),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: TextWidgets.subHeading2(
                      "Cancel",
                      color: appColors.primaryColor.withAlpha(180),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onConfirm();
                    },
                    child: TextWidgets.subHeading2(
                      confirmText,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
