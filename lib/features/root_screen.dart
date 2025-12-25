import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/components/custom_glass_nav_bar.dart';
import 'package:shopx/core/helpers/show_app_toast.dart';
import 'package:shopx/features/cart/screens/cart_screen.dart';
import 'cart/cubit/cart_item_cubit.dart';
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
    screens = const [
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
    return PopScope(
      canPop: false,
      child: BlocProvider(
        create: (context) => CartItemCubit(),
        child: BlocListener<CartItemCubit, CartItemState>(
          listener: (context, state) {
            if (state is CartItemAdded) {
              showAppToast(
                message: 'Item added to cart',
                bgColor: Colors.green,
              );
            }
              if (state is CartItemRemoved) {
                showAppToast(
                  message: 'Item removed from cart',
                  bgColor: Colors.red,
                );
              }
              if (state is CartCleared) {
                showAppToast(
                  message: 'All items cleared from cart',
                  bgColor: Colors.red,
                );
              }
          },
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
                  BottomNavItemData(
                    label: 'Home',
                    icon: const Icon(CupertinoIcons.home),
                    filledIcon: AnimatedIcon(
                      icon: AnimatedIcons.menu_home,
                      progress: iconControllers[0],
                    ),
                  ),
                  BottomNavItemData(
                    label: 'Cart',
                    icon: const Icon(CupertinoIcons.cart),
                    filledIcon: AnimatedIcon(
                      icon: AnimatedIcons.view_list,
                      progress: iconControllers[1],
                    ),
                  ),
                  BottomNavItemData(
                    label: 'History',
                    icon: const Icon(Icons.table_bar_outlined),
                    filledIcon: AnimatedIcon(
                      icon: AnimatedIcons.list_view,
                      progress: iconControllers[2],
                    ),
                  ),
                  BottomNavItemData(
                    label: 'Profile',
                    icon: const Icon(CupertinoIcons.person_alt_circle),
                    filledIcon: AnimatedIcon(
                      icon: AnimatedIcons.arrow_menu,
                      progress: iconControllers[3],
                    ),
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
