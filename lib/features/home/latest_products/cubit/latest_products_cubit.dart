import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/core/repos/products/products_repo.dart';

part 'latest_products_state.dart';

class LatestProductsCubit extends Cubit<LatestProductsState> {
  LatestProductsCubit({required this.productsRepo}) : super(LatestProductsInitial());

  final ProductsRepo productsRepo;

  Future<void> fetchLatestProducts() async {
    emit(LatestProductsLoading());
    final result = await productsRepo.getLatestProducts();
    result.fold(
          (failure) => emit(LatestProductsError(message: failure.toString())),
          (products) => emit(LatestProductsSuccess(products: products)),
    );
  }
}
