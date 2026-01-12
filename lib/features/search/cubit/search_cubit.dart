import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/core/repos/products/products_repo.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.productsRepo}) : super(SearchInitial());

  final ProductsRepo productsRepo;

  List<ProductsEntity> _allProductsCache = [];

  TextEditingController searchController = TextEditingController();

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }

  Future<void> fetchAndCacheProducts() async {
    emit(SearchLoading());
    final result = await productsRepo.getAllProducts();

    result.fold(
      (failure) => emit(SearchFailure(errorMessage: failure.message)),
      (products) {
        _allProductsCache = products;
        emit(SearchInitial());
      },
    );
  }

  void searchLocally(String query) {
    final searchLower = query.trim().toLowerCase();

    if (searchLower.isEmpty) {
      emit(SearchInitial());
      return;
    }

    final filtered = _allProductsCache.where((product) {
      final titleLower = product.name.toLowerCase();
      final words = titleLower.split(' ');
      return words.any((word) => word.startsWith(searchLower));
    }).toList();

    if (filtered.isEmpty) {
      emit(SearchEmpty());
    } else {
      emit(SearchSuccess(searchResults: filtered));
    }
  }

  List<ProductsEntity> getSuggestedProducts() {
    if (_allProductsCache.isEmpty) return [];
    return _allProductsCache.take(5).toList();
  }
}
