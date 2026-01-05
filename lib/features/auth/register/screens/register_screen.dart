import 'package:flutter/material.dart';
import 'package:shopx/core/services/get_it_services.dart';
import 'package:shopx/features/auth/domain/repos/auth_repo.dart';
import 'package:shopx/features/auth/register/cubit/register_cubit.dart';
import 'widgets/register_body_screen_bloc_consumer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt.get<AuthRepo>()),
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(body: const RegisterBodyScreenBlocConsumer()),
      ),
    );
  }
}
