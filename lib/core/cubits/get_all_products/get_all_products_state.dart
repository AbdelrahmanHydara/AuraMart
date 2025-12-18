part of 'get_all_products_cubit.dart';

@immutable
sealed class GetAllProductsState {}

final class GetAllProductsInitial extends GetAllProductsState {}

final class GetAllProductsLoading extends GetAllProductsState {}

final class GetAllProductsSuccess extends GetAllProductsState {
  final List<ProductsEntity> products;

  GetAllProductsSuccess({required this.products});
}

final class GetAllProductsError extends GetAllProductsState {
  final String message;

    GetAllProductsError({required this.message});
}
