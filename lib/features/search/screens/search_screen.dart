import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/repos/products/products_repo.dart';
import 'package:shopx/core/services/get_it_services.dart';
import 'package:shopx/features/search/cubit/search_cubit.dart';
import 'widgets/search_body_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocProvider(
        create: (context) =>
            SearchCubit(productsRepo: getIt.get<ProductsRepo>())
              ..fetchAndCacheProducts(),
        child: Scaffold(body: const SafeArea(child: SearchBodyScreen())),
      ),
    );
  }
}
