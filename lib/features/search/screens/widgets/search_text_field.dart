import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/theme/app_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.onClose,
    this.onSubmit,
    this.onChanged,
    required this.searchController,
  });

  final Function()? onClose;
  final Function(String?)? onSubmit;
  final Function(String?)? onChanged;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return SizedBox(
      height: 38.h,
      child: TextField(
        onChanged: onChanged,
        onSubmitted: onSubmit,
        controller: searchController,
        style: TextStyle(
          fontSize: 14.sp,
          color: appColors.primaryColor,
          decorationThickness: 0,
        ),
        decoration: InputDecoration(
          filled: true,
          hintText: "search  phones ,  laptops ,  etc",
          hintStyle:  TextStyle(
            color: appColors.primaryColor.withAlpha(102),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          prefixIcon: Icon(
            CupertinoIcons.search,
            size: 16.sp,
            color: appColors.primaryColor.withAlpha(102),
          ),
          suffixIcon: InkWell(
            onTap: onClose,
            child: Icon(
              Icons.cancel_outlined,
              size: 20.sp,
              color: appColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
