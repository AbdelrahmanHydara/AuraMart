import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/repos/products/products_repo.dart';
import 'package:shopx/core/routing/app_router.dart';
import 'package:shopx/core/routing/routes.dart';
import 'package:shopx/core/theme/logic/theme_cubit.dart';
import 'package:shopx/core/theme/logic/theme_state.dart';
import 'core/cubits/get_all_products/get_all_products_cubit.dart';
import 'core/helpers/show_app_toast.dart';
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
          BlocProvider(
              create: (context) => ThemeCubit(),
          ),
          BlocProvider(create: (context) => CartItemCubit()
          ),
          BlocProvider(
            create: (context) => GetAllProductsCubit(
              productsRepo: getIt.get<ProductsRepo>(),
            )..fetchAllProducts(),
          ),
        ],
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
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              final theme = (state is ThemeInitial)
                  ? state.themeData
                  : ThemeData.light();
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: theme,
                initialRoute: Routes.rootScreen,
                onGenerateRoute: AppRouter.generateRoute,
              );
            },
          ),
        ),
      ),
    );
  }
}