import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopx/core/constants/app_end_point.dart';
import 'package:shopx/core/errors/exceptions.dart';
import 'package:shopx/core/errors/failures.dart';
import 'package:shopx/core/services/database_services.dart';
import 'package:shopx/core/services/firebase_auth_services.dart';
import 'package:shopx/features/auth/data/model/user_model.dart';
import 'package:shopx/features/auth/domain/entities/user_entity.dart';
import 'package:shopx/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseServices databaseServices;

  AuthRepoImpl({
    required this.databaseServices,
    required this.firebaseAuthService,
  });


  // Create User with Email and Password
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      );
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserToDatabase(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      print("Repository Catch: ${e.toString()}");
      await deleteUser(user);
      return Left(
        ServerFailure(
          "An unexpected error occurred during logout. Please Try again later.",
        ),
      );
    }
  }



  // Login User with Email and Password
  @override
  Future<Either<Failure, UserEntity>> loginUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthService.loginUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserFromDatabase(uid: user.uid);
      return right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      print("Repository Catch: ${e.toString()}");
      return Left(
        ServerFailure(
          "An unexpected error occurred during logout. Please Try again later.",
        ),
      );
    }
  }


  // Login User with Google
  @override
  Future<Either<Failure, UserEntity>> loginUserWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.loginUserWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseServices.checkDataExists(
          docId: user.uid,
          path: AppEndPoint.isUserExists,
      );
      if(isUserExist) {
        await getUserFromDatabase(uid: user.uid);
      } else {
        await addUserToDatabase(user: userEntity);
      }
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      print("Repository Catch: ${e.toString()}");
      await deleteUser(user);
      return Left(ServerFailure(""));
    }
  }


  // Login User with Facebook
  @override
  Future<Either<Failure, UserEntity>> loginUserWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.loginUserWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserToDatabase(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      print("Repository Catch: ${e.toString()}");
      await deleteUser(user);
      return Left(
        ServerFailure(
          "An unexpected error occurred during logout. Please Try again later.",
        ),
      );
    }
  }


  // Logout User
  @override
  Future<Either<Failure, Unit>> logoutUser() async {
    try {
      await firebaseAuthService.logoutUser();
      return right(unit);
    } catch (e) {
      print("Repository Catch: ${e.toString()}");
      return Left(
        ServerFailure(
          "An unexpected error occurred during logout. Please Try again later.",
        ),
      );
    }
  }


  // Delete User
  Future<void> deleteUser(User? user) async {
    if(user != null) {
      await firebaseAuthService.deleteUser();
    }
  }


  // Add User to Database
  @override
  Future addUserToDatabase({required UserEntity user}) async {
    await databaseServices.addData(
      path: AppEndPoint.addUserToDatabase,
      data: user.toMap(),
      docId: user.uId,
    );
  }

  // Get User from Database
  @override
  Future<UserEntity> getUserFromDatabase({required String uid}) async {
   var getUser = await databaseServices.getData(docId: uid, path: AppEndPoint.getUserFromDatabase);
   return UserModel.formJson(getUser);
  }
}
