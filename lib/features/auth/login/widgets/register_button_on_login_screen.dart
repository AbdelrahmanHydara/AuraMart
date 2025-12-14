import 'package:flutter/material.dart';
import 'package:shopx/core/helpers/extensions.dart';
import 'package:shopx/core/routing/routes.dart';
import 'package:shopx/features/auth/widgets/custom_button_auth.dart';

class RegisterButtonOnLoginScreen extends StatelessWidget {
  const RegisterButtonOnLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButtonAuth(
      text: "Create an Account",
      onPressed: () => context.pushReplacementNamed(Routes.registerScreen),
    );
  }
}
