
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/Auth/data/datasource/remote/register_service.dart';
import 'features/Auth/data/repository/register_repository_impl.dart';
import 'features/Auth/domain/repository/register_repository.dart';
import 'features/Auth/domain/usecase/register_use_case.dart';
import 'features/Auth/presentation/auth_bloc/auth_bloc.dart';


final sl = GetIt.instance;

Future<void> initializeDependencies() async {


  
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<AuthServiceImp>(AuthServiceImp(dio: sl()));

  sl.registerSingleton<RegisterRepoImpl>(
    RegisterRepoImpl(authServiceImp: sl())
  );
  
  //UseCases
  sl.registerSingleton<RegisterUseCase>(
    RegisterUseCase(registerRepoImpl: sl())
  );


  //Blocs
  sl.registerFactory<AuthBloc>(
    ()=> AuthBloc(sl())
  );
}