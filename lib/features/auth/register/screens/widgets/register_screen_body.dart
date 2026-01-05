import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'package:shopx/features/auth/register/screens/widgets/login_button_on_register_screen.dart';
import 'package:shopx/features/auth/widgets/custom_glass_container_auth.dart';
import 'package:shopx/features/auth/widgets/heading_auth.dart';
import 'register_button.dart';
import 'register_text_form_field.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

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
            physics: const BouncingScrollPhysics(),
            child: CustomGlassContainerAuth(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  verticalSpace(12),
                  const HeadingAuth(),
                  verticalSpace(28),
                  const RegisterTextFormField(),
                  verticalSpace(28),
                  const RegisterButton(),
                  verticalSpace(20),
                  const LoginButtonOnRegisterScreen(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
