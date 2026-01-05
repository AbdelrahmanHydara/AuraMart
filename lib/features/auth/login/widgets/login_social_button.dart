import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/features/auth/login/cubit/login_cubit.dart';
import 'package:shopx/features/auth/widgets/custom_button_auth.dart';
import 'package:shopx/generated/assets.dart';

class LoginSocialButton extends StatelessWidget {
  const LoginSocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return  Row(
      children: [
        Expanded(
          child: CustomButtonAuth(
            isSocial: true,
            text: AppStrings.loginWithGoogle,
            image: Assets.logosGoogleLogo,
            onPressed: () => cubit.loginUserWithGoogle(),
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: CustomButtonAuth(
            isSocial: true,
            text: AppStrings.loginWithFacebook,
            image: Assets.logosFacebookLogo,
            onPressed: () => cubit.loginUserWithFacebook(),
          ),
        ),
      ],
    );
  }
}
