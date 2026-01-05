import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_button.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'package:shopx/features/auth/login/cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        final bool isLoading = state is LoginLoading;
        return SizedBox(
          width: double.infinity,
          child: CustomButton(
            onPressed: isLoading
                ? null
                : () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.formKey.currentState!.save();
                      cubit.loginUserWithEmailAndPassword();
                    } else {
                      cubit.changeAutoValidateMode();
                    }
                  },
            text: isLoading ? AppStrings.loadingText : AppStrings.login,
            textColor: whiteColor,
            fontSize: 18.sp,
            borderRadius: 16.r,
            backgroundColor: isLoading
                ? Colors.green.shade200
                : Colors.white24,
          ),
        );
      },
    );
  }
}
