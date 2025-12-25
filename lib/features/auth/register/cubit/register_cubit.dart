import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/features/auth/domain/entities/user_entity.dart';
import 'package:shopx/features/auth/domain/repos/auth_repo.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo;

  final formKey = GlobalKey<FormState>();
  late String name, email, password;

  Future<void> createUserWithEmailAndPassword() async {
    emit(RegisterLoading());
    try {
      final result = await authRepo.createUserWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      );
      result.fold(
            (failure) => emit(RegisterError(errorMessage: failure.message)),
            (userEntity) => emit(RegisterSuccess(userEntity: userEntity)),
      );
    } on Exception catch (_) {
      emit(RegisterError(errorMessage: 'A fatal error stopped the process.'));
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
    emit(RegisterChangePasswordVisibilityState());
  }

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  void changeAutoValidateMode() {
    autoValidateMode = AutovalidateMode.always;
    emit(RegisterChangeAutoValidateModeState());
  }
}
