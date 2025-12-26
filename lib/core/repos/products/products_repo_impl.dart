import 'package:dartz/dartz.dart';
import 'package:shopx/core/constants/app_end_point.dart';
import 'package:shopx/core/entity/products_entity.dart';
import 'package:shopx/core/errors/failures.dart';
import 'package:shopx/core/models/products_model.dart';
import 'package:shopx/core/repos/products/products_repo.dart';
import 'package:shopx/core/services/database_services.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DatabaseServices databaseServices;

  ProductsRepoImpl({required this.databaseServices});

  @override
  Future<Either<Failure, List<ProductsEntity>>> getAllProducts() async {
    try {
      var data = await databaseServices.getData(
        path: AppEndPoint.getAllProducts,
      );
      if (data == null) {
        return right([]);
      }

      final list = List<Map<String, dynamic>>.from(data);

      List<ProductsEntity> products = list.map((e) => ProductsModel.fromJson(e).toEntity()).toList();

      return right(products);
    } catch (e) {
      return left(ServerFailure("Failed to fetch products: $e"));
    }
  }

  @override
  Future<Either<Failure, List<ProductsEntity>>> getBestSellingProducts() async {
    try {
      var data = await databaseServices.getData(
        path: AppEndPoint.getAllProducts,
        query: {
          "limit" : 10,
          "orderBy" : "sellingCount",
          "descending" : true,
        },
      );
      if (data == null) {
        return right([]);
      }
      final list = List<Map<String, dynamic>>.from(data);

      List<ProductsEntity> products = list.map((e) => ProductsModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure("Failed to fetch products: $e"));
    }
  }

  @override
  Future<Either<Failure, List<ProductsEntity>>> getLatestProducts() async {
    try {
      var data = await databaseServices.getData(
        path: AppEndPoint.getAllProducts,
        query: {
          "limit": 10,
          "orderBy": "createdAt",
          "descending": true,
        },
      );
      if (data == null) {
        return right([]);
      }
      final list = List<Map<String, dynamic>>.from(data);

      List<ProductsEntity> products = list.map((e) => ProductsModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure("Failed to fetch latest products: $e"));
    }
  }

  @override
  Future<Either<Failure, List<ProductsEntity>>> getProductsByCategory({required String categoryName}) async {
    try {
      var data = await databaseServices.getData(
        path: AppEndPoint.getAllProducts,
        query: {
          "where": {
            "field": "category",
            "value": categoryName,
          },
        },
      );
      if (data == null) {
        return right([]);
      }

      final list = List<Map<String, dynamic>>.from(data);
      List<ProductsEntity> products = list.map((e) => ProductsModel.fromJson(e).toEntity()).toList();

      return right(products);
    } catch (e) {
      return left(ServerFailure("Failed to fetch category products: $e"));
    }
  }
}