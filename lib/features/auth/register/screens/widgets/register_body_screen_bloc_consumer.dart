import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/helpers/extensions.dart';
import 'package:shopx/core/helpers/show_top_message.dart';
import 'package:shopx/core/routing/routes.dart';
import 'package:shopx/features/auth/register/cubit/register_cubit.dart';
import 'register_screen_body.dart';

class RegisterBodyScreenBlocConsumer extends StatelessWidget {
  const RegisterBodyScreenBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          showTopMessage(
            message: AppStrings.registeredSuccessfully,
            isError: false,
          );
          context.pushNamed(Routes.loginScreen);
        }
        if (state is RegisterError) {
          showTopMessage(
            message: state.errorMessage,
            isError: true,
          );
        }
      },
      builder: (context, state) {
        return const RegisterScreenBody();
      },
    );
  }
}
