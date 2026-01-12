import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'package:shopx/features/search/cubit/search_cubit.dart';
import 'search_view_products.dart';

class SearchInitialSuggestions extends StatelessWidget {
  const SearchInitialSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    final cubit = context.read<SearchCubit>();
    final suggestions = cubit.getSuggestedProducts();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: TextWidgets.subHeading2(
            AppStrings.suggested,
            color: appColors.primaryColor.withAlpha(200),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: suggestions.length,
            separatorBuilder: (context, index) => const Divider(thickness: 0.5),
            itemBuilder: (context, index) =>
                SearchViewProducts(productsEntity: suggestions[index]),
          ),
        ),
      ],
    );
  }
}
