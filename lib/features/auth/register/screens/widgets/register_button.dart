import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/components/custom_button.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/theme/app_colors.dart';
import 'package:shopx/features/auth/register/cubit/register_cubit.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        final bool isLoading = state is RegisterLoading;
        return SizedBox(
          width: double.infinity,
          child: CustomButton(
            onPressed: isLoading
                ? null
                : () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.formKey.currentState!.save();
                      cubit.createUserWithEmailAndPassword();
                    } else {
                      cubit.changeAutoValidateMode();
                    }
                  },
            text: isLoading ? AppStrings.loadingText : AppStrings.register,
            textColor: whiteColor,
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
