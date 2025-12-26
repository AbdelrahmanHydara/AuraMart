import 'package:dartz/dartz.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/core/errors/failures.dart';

abstract class ProductsRepo {
  Future<Either<Failure,List<ProductsEntity>>> getAllProducts();

  Future<Either<Failure,List<ProductsEntity>>> getBestSellingProducts();

  Future<Either<Failure,List<ProductsEntity>>> getLatestProducts();

  Future<Either<Failure,List<ProductsEntity>>> getProductsByCategory({required String categoryName});
}