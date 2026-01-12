import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'package:shopx/features/search/cubit/search_cubit.dart';

class SearchFailureResult extends StatelessWidget {
  const SearchFailureResult({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    final cubit = context.read<SearchCubit>();
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.exclamationmark_triangle_fill,
              size: 80.sp,
              color: Colors.redAccent.withAlpha(204),
            ),
            verticalSpace(20),
            TextWidgets.subHeading1(
              AppStrings.oops,
              color: appColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
            verticalSpace(10),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            ),
            verticalSpace(30),
            SizedBox(
              width: 150.w,
              child: ElevatedButton(
                onPressed: () {
                  cubit.fetchAndCacheProducts();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: appColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  AppStrings.retry,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
