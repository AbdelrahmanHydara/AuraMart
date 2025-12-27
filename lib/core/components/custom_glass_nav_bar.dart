import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'custom_text.dart';

class GlassBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavItemData> items;

  const GlassBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  State<GlassBottomNavBar> createState() => _GlassBottomNavBarState();
}

class _GlassBottomNavBarState extends State<GlassBottomNavBar> {
  double _pillLeft = 0;

  void _updatePill(double width) {
    final itemWidth = width / widget.items.length;
    _pillLeft =
        itemWidth * widget.currentIndex + (itemWidth - 40) / 2;
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final totalWidth = constraints.maxWidth;
          if (_pillLeft == 0) {
            _updatePill(totalWidth);
          }
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 50, sigmaY: 80),
                  child: Container(
                    height: 64.h,
                    decoration: BoxDecoration(
                      color: appColors.bgBottomNavBar.withAlpha(180),
                      borderRadius: BorderRadius.circular(100.r),
                      border: Border.all(
                        color: Colors.white.withAlpha(40),
                        width: 0.8,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(30),
                          blurRadius: 25,
                          offset: const Offset(10, 40),
                        ),
                      ],
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.linear,
                          left: _pillLeft,
                          top: -4,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.linear,
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withAlpha(180),
                                  Colors.white.withAlpha(60),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade700,
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            child: BackdropFilter(
                              filter:
                              ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                              child: const SizedBox(),
                            ),
                          ),
                        ),
                        Row(
                          children: List.generate(widget.items.length, (index) {
                            final item = widget.items[index];
                            final isSelected = index == widget.currentIndex;
                            return Expanded(
                              child: InkWell(
                                onTap: () {
                                  widget.onTap(index);
                                  setState(() {
                                    final itemWidth =
                                        totalWidth / widget.items.length;
                                    _pillLeft = itemWidth * index +
                                        (itemWidth - 40) / 2;
                                  });
                                },
                                borderRadius: BorderRadius.circular(100.r),
                                child: Container(
                                  height: 74.h,
                                  decoration: isSelected
                                      ? BoxDecoration(
                                    color: Colors.grey.withAlpha(35),
                                    borderRadius: BorderRadius.circular(100.r),
                                  ) : null,
                                  padding: isSelected ?
                                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h) : null,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconTheme(
                                        data: IconThemeData(
                                          size: isSelected ? 22 : 20,
                                          color: isSelected
                                              ? appColors.primaryColor.withAlpha(220)
                                              : appColors.primaryColor.withAlpha(120),
                                        ),
                                        child: item.icon,
                                      ),
                                      verticalSpace(2),
                                      CustomText(
                                        text: item.label,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: isSelected
                                            ? appColors.primaryColor.withAlpha(220)
                                            : appColors.primaryColor.withAlpha(140),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class BottomNavItemData {
  final Widget icon;
  final String label;
  final Widget? filledIcon;

  BottomNavItemData({
    required this.icon,
    required this.label,
    this.filledIcon,
  });
}

