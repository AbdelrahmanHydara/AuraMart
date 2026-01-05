import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'package:shopx/features/auth/widgets/custom_glass_container_auth.dart';
import 'package:shopx/features/auth/widgets/heading_auth.dart';
import 'login_forgot_password.dart';
import 'login_button.dart';
import 'login_social_button.dart';
import 'login_text_form_field.dart';
import 'or_continue_with.dart';
import 'register_button_on_login_screen.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: gradientAuth),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            child: CustomGlassContainerAuth(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  verticalSpace(12),
                  const HeadingAuth(),
                  verticalSpace(28),
                  const LoginTextFormField(),
                  const LoginForgotPassword(),
                  verticalSpace(10),
                  const LoginButton(),
                  verticalSpace(26),
                  const RegisterButtonOnLoginScreen(),
                  verticalSpace(16),
                  const OrContinueWith(),
                  verticalSpace(16),
                  const LoginSocialButton(),
                  verticalSpace(12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


