import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/helpers/app_validators.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/features/auth/login/cubit/login_cubit.dart';
import 'package:shopx/features/auth/widgets/custom_auth_text_field.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Form(
      key: cubit.formKey,
      autovalidateMode: cubit.autoValidateMode,
      child: Column(
        children: [
          CustomAuthTextField(
            hint: AppStrings.userExample,
            label: AppStrings.email,
            onSaved: (value) => cubit.email = value!,
            prefixIcon: cubit.prefixIconEmail,
            keyboardType: TextInputType.emailAddress,
            validator: AppValidators.emailValidator,
          ),
          verticalSpace(20),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return CustomAuthTextField(
                hint: "••••••••",
                label: AppStrings.password,
                onSaved: (value) => cubit.password = value!,
                obscureText: cubit.isPasswordVisible,
                prefixIcon: cubit.prefixIconPassword,
                suffixIcon: cubit.suffixIconPassword,
                suffixPressed: () => cubit.changePasswordVisibility(),
                keyboardType: TextInputType.visiblePassword,
                validator: AppValidators.passwordValidator,
              );
            },
          ),
        ],
      ),
    );
  }
}
