import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/repos/products/products_repo.dart';
import 'package:shopx/core/routing/app_router.dart';
import 'package:shopx/core/routing/routes.dart';
import 'package:shopx/core/theme/logic/theme_cubit.dart';
import 'package:shopx/core/theme/logic/theme_state.dart';
import 'core/cubits/get_all_products/get_all_products_cubit.dart';
import 'core/helpers/show_top_message.dart';
import 'core/services/get_it_services.dart';
import 'features/cart/cubit/cart_item_cubit.dart';

class ShopX extends StatelessWidget {
  const ShopX({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(380, 820),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          /// Theme App Cubit
          BlocProvider(create: (context) => ThemeCubit()),
          /// Cart Item Cubit
          BlocProvider(create: (context) => CartItemCubit()),
          /// Fetch all products at app start
          BlocProvider(create: (context) => GetAllProductsCubit(
              productsRepo: getIt.get<ProductsRepo>(),
            )..fetchAllProducts(),),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            final theme = (state is ThemeInitial) ? state.themeData : ThemeData.light();
            return MaterialApp(
              theme: theme,
              debugShowCheckedModeBanner: false,
              initialRoute: Routes.rootScreen,
              onGenerateRoute: AppRouter.generateRoute,
              /// Navigator Key for showing top messages
              navigatorKey: AppRouter.navigatorKey,
              builder: (context, child) {
                return BlocListener<CartItemCubit, CartItemState>(
                  listener: (context, state) {
                    if (state is CartItemAdded) {
                      showTopMessage(
                        message: AppStrings.itemAdded,
                        isError: false,
                      );
                    }
                    if (state is CartItemRemoved) {
                      showTopMessage(
                        message: AppStrings.itemRemoved,
                        isError: true,
                      );
                    }
                    if (state is CartCleared) {
                      showTopMessage(
                        message: AppStrings.allItemsCleared,
                        isError: true,
                      );
                    }
                  },
                  child: child!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}