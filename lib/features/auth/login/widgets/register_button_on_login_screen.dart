import 'package:flutter/material.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/helpers/extensions.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/routing/routes.dart';
import 'package:shopx/features/auth/widgets/custom_button_auth.dart';

class RegisterButtonOnLoginScreen extends StatelessWidget {
  const RegisterButtonOnLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButtonAuth(
            text: AppStrings.createAnAccount,
            onPressed: () => context.pushReplacementNamed(Routes.registerScreen),
          ),
        ),
        horizontalSpace(10),
        Expanded(
          child: CustomButtonAuth(
            text: AppStrings.guestUser,
            onPressed: () => context.pushReplacementNamed(Routes.rootScreen),
          ),
        ),
      ],
    );
  }
}
