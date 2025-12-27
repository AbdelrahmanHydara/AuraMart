import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopx/core/components/custom_glass_nav_bar.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/helpers/build_bottom_nav_bar_item.dart';
import 'package:shopx/features/cart/screens/cart_screen.dart';
import '../core/theme/app_colors.dart';
import 'home/home/screens/home_screen.dart';
import 'profile/screens/profile_screen.dart';
import 'search/screens/search_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  late PageController controller;
  late List<Widget> screens;
  int currentScreen = 0;

  late List<AnimationController> iconControllers;

  @override
  void initState() {
    super.initState();
    screens = [
      HomeScreen(),
      SearchScreen(),
      CartScreen(),
      ProfileScreen(),
    ];

    controller = PageController(initialPage: 0);
    iconControllers = List.generate(
      4,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
      ),
    );
    iconControllers[currentScreen].forward();
  }

  void _onTabTapped(int index) {
    setState(() => currentScreen = index);
    controller.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOutExpo,
    );
    iconControllers[index].forward();
    for (var i = 0; i < iconControllers.length; i++) {
      if (i != index) iconControllers[i].reverse();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    for (var c in iconControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return PopScope(
      canPop: false,
      child: Scaffold(
          extendBody: true,
          body: PageView(
            controller: controller,
            allowImplicitScrolling: true,
            physics: const NeverScrollableScrollPhysics(),
            children: screens,
          ),
          bottomNavigationBar: GlassBottomNavBar(
            currentIndex: currentScreen,
            onTap: _onTabTapped,
            items: [
              buildBottomNavItemDataItem(
                index: 0,
                iconControllers: iconControllers,
                icon: CupertinoIcons.house,
                filledIcon: CupertinoIcons.house_fill,
                label: AppStrings.home,
                appColors: appColors,
              ),
              buildBottomNavItemDataItem(
                index: 1,
                iconControllers: iconControllers,
                icon: CupertinoIcons.search,
                filledIcon: Icons.search,
                label: AppStrings.search,
                appColors: appColors,
              ),
              buildBottomNavItemDataItem(
                index: 2,
                iconControllers: iconControllers,
                icon: CupertinoIcons.cart,
                filledIcon: CupertinoIcons.cart_fill,
                label: AppStrings.cart,
                appColors: appColors,
              ),
              buildBottomNavItemDataItem(
                index: 3,
                iconControllers: iconControllers,
                icon: CupertinoIcons.person,
                filledIcon: CupertinoIcons.person_fill,
                label: AppStrings.profile,
                appColors: appColors,
              ),
            ],
          ),
        ),
    );
  }


}


