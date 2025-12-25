import 'package:flutter/material.dart';

const Color blackColor = Color(0xFF1C1C1E);
const Color whiteColor = Color(0xFFFFFFFF);
const Color searchBlackColor = Colors.black26;

const Color bgBottomNavBarLight = Color(0xFFEDEDED);
const Color bgBottomNavBarDark = Color(0xFF1C1C1E);

 const Color whiteColor70 = Colors.white70;
 const Color goldenColor = Color(0xffcfb53b);
 const Color blueColor = Color(0xff3966de);
 const Color yellowColor = Color(0xffffee00);
 const Color greenColor = Color(0xff019309);

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.searchColor,
    required this.bgBottomNavBar,
  });

  final Color primaryColor;
  final Color secondaryColor;
  final Color searchColor;
  final Color bgBottomNavBar;

  @override
  AppColors copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? searchColor,
    Color? bgBottomNavBar,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      searchColor: searchColor ?? this.searchColor,
      bgBottomNavBar: bgBottomNavBar ?? this.bgBottomNavBar,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other == null) return this;
    return AppColors(
      primaryColor:
      Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor:
      Color.lerp(secondaryColor, other.secondaryColor, t)!,
      searchColor:
      Color.lerp(searchColor, other.searchColor, t)!,
      bgBottomNavBar:
      Color.lerp(bgBottomNavBar, other.bgBottomNavBar, t)!,
    );
  }

  static const light = AppColors(
    primaryColor: blackColor,
    secondaryColor: whiteColor,
    searchColor: whiteColor,
    bgBottomNavBar: bgBottomNavBarLight,
  );

  static const dark = AppColors(
    primaryColor: whiteColor,
    secondaryColor: blackColor,
    searchColor: searchBlackColor,
    bgBottomNavBar: bgBottomNavBarDark,
  );
}
