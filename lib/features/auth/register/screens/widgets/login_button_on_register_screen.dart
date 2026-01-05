import 'package:flutter/material.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/helpers/extensions.dart';
import 'package:shopx/core/routing/routes.dart';
import 'package:shopx/features/auth/widgets/custom_button_auth.dart';

class LoginButtonOnRegisterScreen extends StatelessWidget {
  const LoginButtonOnRegisterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButtonAuth(
      text: AppStrings.goToLogin,
      onPressed: () => context.pushReplacementNamed(Routes.loginScreen),
    );
  }
}
