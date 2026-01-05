import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/helpers/extensions.dart';
import 'package:shopx/core/helpers/show_top_message.dart';
import 'package:shopx/core/routing/routes.dart';
import 'package:shopx/features/auth/login/cubit/login_cubit.dart';
import 'login_screen_body.dart';

class LoginBodyScreenBlocConsumer extends StatelessWidget {
  const LoginBodyScreenBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
            showTopMessage(
              context: context,
              message: AppStrings.loginSuccessfully,
              isError: false,
            );
          context.pushReplacementNamed(Routes.rootScreen);
        }
        if (state is LoginError) {
            showTopMessage(
              context: context,
              message: state.errorMessage,
              isError: true,
            );
        }
      },
      builder: (context, state) {
        return const LoginScreenBody();
      },
    );
  }
}
