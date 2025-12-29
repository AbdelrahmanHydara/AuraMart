import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopx/core/components/custom_confirmation_dialog.dart';
import 'package:shopx/core/constants/app_strings.dart';
import 'package:shopx/core/routing/routes.dart';

bool get isGuest => FirebaseAuth.instance.currentUser == null;

void showLoginRequiredDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => CustomConfirmationDialog(
      title: AppStrings.loginRequired,
      content: AppStrings.signInToAddItems,
      confirmText: AppStrings.login,
      onConfirm: () {
        Navigator.pushNamed(context, Routes.loginScreen);
      },
    ),
  );
}
