import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/constants/app_categories_sections.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/theme/app_colors.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    this.onClose,
    this.onSubmit,
    this.onChanged,
    required this.searchController,
  });

  final VoidCallback? onClose;
  final Function(String?)? onSubmit;
  final Function(String?)? onChanged;
  final TextEditingController searchController;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final FocusNode _focusNode = FocusNode();
  int _currentIndex = 0;
  Timer? _timer;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() => _isFocused = _focusNode.hasFocus);
    });

    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!mounted) return;
      setState(() {
        _currentIndex =
            (_currentIndex + 1) % AppCategoriesSections.categoriesList.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return Row(
      children: [
        Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 42.h,
            decoration: BoxDecoration(
              color: appColors.searchColor,
              borderRadius: BorderRadius.circular(14.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(10),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              focusNode: _focusNode,
              controller: widget.searchController,
              textInputAction: TextInputAction.search,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: appColors.primaryColor,
              ),
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmit,
              decoration: InputDecoration(
                hintText:
                    "Search for ${AppCategoriesSections.categoriesList[_currentIndex].name}",
                hintStyle: TextStyle(
                  color: appColors.primaryColor.withAlpha(115),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  size: 18.sp,
                  color: appColors.primaryColor.withAlpha(115),
                ),
              ),
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: _isFocused
              ? Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: GestureDetector(
                    onTap: () {
                      _focusNode.unfocus();
                      widget.searchController.clear();
                      widget.onClose?.call();
                    },
                    child: Text(
                      AppStrings.cancel,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: appColors.primaryColor,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
