
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ride_application/features/categories/data/datasource/remote/categories_service.dart';
import 'package:ride_application/features/categories/data/repository/category_repository_impl.dart';
import 'package:ride_application/features/categories/domain/usecase/bicycle_use_case.dart';
import 'package:ride_application/features/categories/domain/usecase/category_use_case.dart';
import 'package:ride_application/features/categories/presentation/bicycle_bloc/bicycle_bloc.dart';
import 'package:ride_application/features/categories/presentation/category_bloc/category_bloc.dart';
import 'package:ride_application/features/hub_content/data/datasource/remote/hub_contents_service.dart';
import 'package:ride_application/features/hub_content/data/repository/hub_contents_repository_impl.dart';
import 'package:ride_application/features/hub_content/domain/usecase/get_hub_contents__use_case.dart';
import 'package:ride_application/features/hub_content/presentation/hub_contents_bloc/hub_contens_bloc.dart';

import 'features/auth/data/datasource/remote/register_service.dart';
import 'features/auth/data/repository/register_repository_impl.dart';
import 'features/auth/domain/usecase/register_use_case.dart';
import 'features/auth/presentation/auth_bloc/auth_bloc.dart';


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



  sl.registerSingleton<CategoriesServiceImp>(CategoriesServiceImp(dio: Dio()));
    sl.registerSingleton<CategoryRepoImpl>(CategoryRepoImpl(categoriesServiceImp: sl()));

  sl.registerSingleton<CategoryUseCase>(CategoryUseCase(categoryRepoImpl: sl()));

 sl.registerFactory<CategoryBloc>(
    ()=> CategoryBloc(sl())
  );

  sl.registerSingleton<BicycleUseCase>(BicycleUseCase(categoryRepoImpl: sl()));

 sl.registerFactory<BicycleBloc>(
    ()=> BicycleBloc(sl())
  );

  
  sl.registerSingleton<HubContentServiceImp>(HubContentServiceImp(dio: sl()));

  
  sl.registerSingleton<HubContenRepoImpl>(HubContenRepoImpl(hubContentServiceImp: sl()));


  sl.registerSingleton<GetHubContentsUseCase>(GetHubContentsUseCase(hubContenRepoImpl: sl()));
 sl.registerFactory<HubContentsBloc>(
    ()=> HubContentsBloc(sl())
  );


}