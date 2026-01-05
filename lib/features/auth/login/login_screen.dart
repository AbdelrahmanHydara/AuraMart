import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/services/get_it_services.dart';
import 'package:shopx/features/auth/domain/repos/auth_repo.dart';
import 'package:shopx/features/auth/login/cubit/login_cubit.dart';
import 'widgets/login_body_screen_bloc_consumer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<AuthRepo>()),
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(body: const LoginBodyScreenBlocConsumer()),
      ),
    );
  }
}
