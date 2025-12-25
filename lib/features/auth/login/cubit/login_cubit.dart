import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/features/auth/domain/entities/user_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopx/features/auth/domain/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  final formKey = GlobalKey<FormState>();
  late String email, password;

  Future<void> loginUserWithEmailAndPassword() async {
    emit(LoginLoading());
    try {
      final result = await authRepo.loginUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      result.fold(
            (failure) => emit(LoginError(errorMessage: failure.message)),
            (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
      );
    } on Exception catch (_) {
      emit(LoginError(errorMessage: 'A fatal error stopped the process.'));
    }
  }

  Future<void> loginUserWithGoogle() async {
    emit(LoginLoadingSocial());
    try {
      final result = await authRepo.loginUserWithGoogle();
      result.fold(
            (failure) => emit(LoginError(errorMessage: failure.message)),
            (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
      );
    } on Exception catch (_) {
      emit(LoginError(errorMessage: 'A fatal error stopped the process.'));
    }
  }

  Future<void> loginUserWithFacebook() async {
    emit(LoginLoadingSocial());
    try {
      final result = await authRepo.loginUserWithFacebook();
      result.fold(
            (failure) => emit(LoginError(errorMessage: failure.message)),
            (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
      );
    } on Exception catch (_) {
      emit(LoginError(errorMessage: 'A fatal error stopped the process.'));
    }
  }

  IconData prefixIconName = CupertinoIcons.person;
  IconData prefixIconEmail = CupertinoIcons.mail;
  IconData prefixIconPassword = CupertinoIcons.lock;
  IconData suffixIconPassword = CupertinoIcons.eye_slash;
  bool isPasswordVisible = true;
  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    suffixIconPassword =
    isPasswordVisible ? CupertinoIcons.eye_slash : CupertinoIcons.eye;
    emit(LoginChangePasswordVisibilityState());
  }

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  void changeAutoValidateMode() {
    autoValidateMode = AutovalidateMode.always;
    emit(LoginChangeAutoValidateModeState());
  }
}
