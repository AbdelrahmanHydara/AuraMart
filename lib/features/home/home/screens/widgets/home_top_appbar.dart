import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_text.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'package:shopx/core/theme/logic/theme_cubit.dart';
import 'package:shopx/features/home/home/screens/home_screen.dart';

class HomeTopAppBar extends StatelessWidget {
  const HomeTopAppBar({super.key,});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 4.h,
      ),
      child: Row(
        children: [
          TextWidgets.heading(
            "ShopX",
            color: appColors.primaryColor,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => context.read<ThemeCubit>().toggleTheme(),
            child: Icon(
              CupertinoIcons.brightness,
              color: appColors.primaryColor,
            ),
          ),
          horizontalSpace(10),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const HomeScreen())),
            child: const Badge(
              smallSize: 8,
              backgroundColor: Colors.red,
              child: Icon(
                CupertinoIcons.heart,
              ),
            ),
          ),
        ],
      ),
    );
  }
}