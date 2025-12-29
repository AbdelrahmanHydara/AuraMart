import 'package:flutter/material.dart';
import 'package:shopx/core/constants/app_strings.dart';

Color getCategoryColor(String? categoryName) {
  if (categoryName == AppStrings.cameras) {
    return const Color(0xFF607D8B);
  } else if (categoryName == AppStrings.phones) {
    return const Color(0xFF2196F3);
  } else if (categoryName == AppStrings.laptops) {
    return const Color(0xFF673AB7);
  } else if (categoryName == AppStrings.airPods) {
    return const Color(0xFF00BCD4);
  } else if (categoryName == AppStrings.watches) {
    return const Color(0xFFE91E63);
  } else if (categoryName == AppStrings.tools) {
    return const Color(0xFFFF9800);
  } else if (categoryName == AppStrings.drones) {
    return const Color(0xFF4CAF50);
  } else if (categoryName == AppStrings.games) {
    return const Color(0xFF6200EA);
  } else {
    return const Color(0xFFFE3131);
  }
}