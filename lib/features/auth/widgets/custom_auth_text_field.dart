import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/core/theme/app_colors.dart';

class CustomAuthTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData prefixIcon;
  final bool? obscureText;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function()? suffixPressed;

  const CustomAuthTextField({
    super.key,
    this.validator,
    this.obscureText,
    this.suffixIcon,
    this.onSaved,
    this.suffixPressed,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: whiteColor70,
            decoration: TextDecoration.none,
          ),
        ),
        verticalSpace(8),
        TextFormField(
          obscureText: obscureText ?? false,
          validator: validator,
          onSaved: onSaved,
          keyboardType: keyboardType,
          cursorColor: whiteColor.withAlpha(179),
          selectionControls: materialTextSelectionControls,
          style: const TextStyle(
            color: whiteColor,
            decoration: TextDecoration.none,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white38),
            prefixIcon: Icon(prefixIcon, color: whiteColor70, size: 18.sp),
            suffixIcon: IconButton(
              icon: Icon(suffixIcon, color: whiteColor70, size: 18.sp),
              onPressed: suffixPressed,
            ),
            filled: true,
            fillColor: Colors.white12,
            errorStyle: const TextStyle(color: Colors.redAccent),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
