import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'package:shopx/features/search/cubit/search_cubit.dart';

class SearchEmptyResult extends StatelessWidget {
  const SearchEmptyResult({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    final cubit = context.read<SearchCubit>();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          verticalSpace(80),
          Icon(
            CupertinoIcons.search_circle,
            size: 100.sp,
            color: appColors.primaryColor.withAlpha(77),
          ),
          verticalSpace(20),
          TextWidgets.subHeading1(
            AppStrings.noFound,
            color: appColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          verticalSpace(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Text(
              AppStrings.tryChecking,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14.sp),
            ),
          ),
          verticalSpace(30),
          OutlinedButton(
            onPressed: () {
              cubit.searchController.clear();
              cubit.searchLocally('');
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: appColors.primaryColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              AppStrings.clearSearch,
              style: TextStyle(color: appColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
