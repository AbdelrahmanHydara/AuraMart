import 'package:flutter/material.dart';
import 'package:shopx/features/search/cubit/search_cubit.dart';
import 'package:shopx/features/search/screens/widgets/search_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SearchTextField(
        searchController: cubit.searchController,
        onChanged: (value) {
          if (value != null) {
            cubit.searchLocally(value);
          }
        },
        onClose: () {
          cubit.searchController.clear();
          cubit.searchLocally('');
        },
        onSubmit: (value) {
          if (value != null) {
            cubit.searchLocally(value);
          }
        },
      ),
    );
  }
}
