part of 'latest_products_cubit.dart';

@immutable
sealed class LatestProductsState {}

final class LatestProductsInitial extends LatestProductsState {}

final class LatestProductsLoading extends LatestProductsState {}

final class LatestProductsSuccess extends LatestProductsState {
  final List<ProductsEntity> products;

  LatestProductsSuccess({required this.products});
}

final class LatestProductsError extends LatestProductsState {
  final String message;

  LatestProductsError({required this.message});
}