import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/core/repos/products/products_repo.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit({required this.productsRepo}) : super(GetAllProductsInitial());

  final ProductsRepo productsRepo;

  Future<void> fetchAllProducts() async {
    emit(GetAllProductsLoading());
    final result = await productsRepo.getAllProducts();
    result.fold(
      (failure) => emit(GetAllProductsError(message: failure.toString())),
      (products) => emit(GetAllProductsSuccess(products: products)),
    );
  }
}
