import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/routing/app_router.dart';
import 'package:shopx/core/theme/app_colors.dart';

/// Displays a temporary top message overlay.
void showTopMessage({required String message, bool isError = true}) {
  final OverlayState? overlay = AppRouter.navigatorKey.currentState?.overlay;

  if (overlay == null) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showTopMessage(message: message, isError: isError);
    });
    return;
  }

  final overlayEntry = OverlayEntry(
    builder: (context) {
      return Positioned(
        top: MediaQuery.of(context).padding.top + 16,
        left: 16.w,
        right: 16.w,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isError ? Colors.red.shade900 : Colors.green.shade700,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 10),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  isError
                      ? CupertinoIcons.xmark_circle
                      : CupertinoIcons.check_mark_circled,
                  color: whiteColor,
                  size: 20.sp,
                ),
                horizontalSpace(8),
                Expanded(
                  child: CustomText(
                    text: message,
                    color: whiteColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}
