import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/core/repos/products/products_repo.dart';
part 'best_selling_products_state.dart';

class BestSellingProductsCubit extends Cubit<BestSellingProductsState> {
  BestSellingProductsCubit({required this.productsRepo})
    : super(BestSellingProductsInitial());

  final ProductsRepo productsRepo;

  Future<void> fetchBestSellingProducts() async {
    emit(BestSellingProductsLoading());
    final result = await productsRepo.getBestSellingProducts();
    result.fold(
      (failure) => emit(BestSellingProductsError(message: failure.toString())),
      (products) => emit(BestSellingProductsSuccess(products: products)),
    );
  }
}
