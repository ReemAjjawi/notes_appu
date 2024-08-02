import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_application/features/Auth/data/datasource/remote/register_service.dart';
import 'package:ride_application/features/Auth/domain/usecase/register_use_case.dart';

import '../../data/repository/register_repository_impl.dart';
import '../article_bloc/articles_bloc.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (_) => AuthBloc(SignUpUseCase(
          registerRepoImpl: RegisterRepoImpl(authServiceImp: AuthServiceImp(dio: Dio())

          )
        ))
          ..add(
            RegisterEvent(),
          ),
      child: Scaffold(
        body: BlocBuilder<AuthBloc, RegisterClassState>(
          builder: (context, state) {
            if (state is SuccessState) {
              return Container(
                child: Text("hiiiiii"),
              );
            } else if (state is FailureState) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
