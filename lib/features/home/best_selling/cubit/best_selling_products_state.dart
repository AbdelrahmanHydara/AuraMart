part of 'best_selling_products_cubit.dart';

@immutable
sealed class BestSellingProductsState {}

final class BestSellingProductsInitial extends BestSellingProductsState {}

final class BestSellingProductsLoading extends BestSellingProductsState {}

final class BestSellingProductsSuccess extends BestSellingProductsState {
  final List<ProductsEntity> products;

    BestSellingProductsSuccess({required this.products});
  }

final class BestSellingProductsError extends BestSellingProductsState {
  final String message;

    BestSellingProductsError({required this.message});
}