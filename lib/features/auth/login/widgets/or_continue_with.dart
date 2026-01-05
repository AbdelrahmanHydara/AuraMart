import 'package:flutter/material.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/theme/app_colors.dart';

class OrContinueWith extends StatelessWidget {
  const OrContinueWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.orContinueWith,
      style: TextStyle(
        color: whiteColor.withAlpha(153),
      ),
    );
  }
}
