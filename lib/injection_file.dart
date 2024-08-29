import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ride_application/features/authation/data/datasource/remote/register_service.dart';
import 'package:ride_application/features/authation/data/repository/register_repository_impl.dart';
import 'package:ride_application/features/authation/domain/usecase/login_use_case.dart';
import 'package:ride_application/features/authation/domain/usecase/register_use_case.dart';
import 'package:ride_application/features/authation/presentation/auth_bloc/auth_bloc.dart';
import 'package:ride_application/features/authation/presentation/login_bloc/login_bloc.dart';
import 'package:ride_application/features/wallet/data/datasource/remote/create_wallet_service.dart';
import 'package:ride_application/features/wallet/data/repository/wallet_creation_repository_impl.dart';
import 'package:ride_application/features/wallet/presentation/bloc/wallet_creation_bloc/wallet_creation_bloc.dart';
import 'features/categories/data/datasource/remote/categories_service.dart';
import 'features/categories/data/repository/category_repository_impl.dart';
import 'features/categories/domain/usecase/bicycle_use_case.dart';
import 'features/categories/domain/usecase/category_use_case.dart';
import 'features/categories/presentation/bicycle_bloc/bicycle_bloc.dart';
import 'features/categories/presentation/category_bloc/category_bloc.dart';
import 'features/changepassword/data/datasource/remote/changepassword_service.dart';
import 'features/changepassword/data/repository/changepassword_repository_impl.dart';
import 'features/changepassword/domain/usecase/changepassword_use_case.dart';
import 'features/changepassword/presentation/changepassword_bloc/changepassword_bloc.dart';
import 'features/get_wallet/data/datasource/remote/get_wallet_service.dart';
import 'features/get_wallet/data/repository/wallet_creation_repository_impl.dart';
import 'features/get_wallet/domain/usecase/wallet_info_use_case.dart';
import 'features/get_wallet/presentation/bloc/wallet_info_bloc.dart';
import 'features/hub_content/data/datasource/remote/hub_contents_service.dart';
import 'features/hub_content/data/repository/hub_contents_repository_impl.dart';
import 'features/hub_content/domain/usecase/get_hub_contents__use_case.dart';
import 'features/hub_content/presentation/hub_contents_bloc/hub_contens_bloc.dart';
import 'features/map/data/datasource/remote/Hub_service.dart';
import 'features/map/data/repository/register_repository_impl.dart';
import 'features/map/domain/usecase/register_use_case.dart';
import 'features/map/presentation/hub_bloc/hub_bloc.dart';
import 'features/policy/data/datasource/remote/policy_service.dart';
import 'features/policy/data/repository/register_repository_impl.dart';
import 'features/policy/domain/usecase/getpolicy_use_case.dart';
import 'features/policy/domain/usecase/putpolicy_use_case.dart';
import 'features/policy/presentation/policy_bloc/policy_bloc.dart';
import 'features/policy/presentation/putpolicyBloc/putpolicy_bloc.dart';
import 'features/request_rent/data/datasource/remote/register_service.dart';
import 'features/request_rent/data/repository/register_repository_impl.dart';
import 'features/request_rent/domain/usecase/register_use_case.dart';
import 'features/request_rent/presentation/Reservation_bloc/Reservation_bloc.dart';
import 'features/wallet/domain/usecase/wallet_creation_use_case.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<AuthServiceImp>(AuthServiceImp(dio: sl()));

  sl.registerSingleton<RegisterRepoImpl>(
      RegisterRepoImpl(authServiceImp: sl()));

  //UseCases
  sl.registerSingleton<RegisterUseCase>(
      RegisterUseCase(registerRepoImpl: sl()));

  //Blocs
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));
//___________________________________

  sl.registerSingleton<LogInUseCase>(LogInUseCase(registerRepoImpl: sl()));

  sl.registerFactory<LogInBloc>(() => LogInBloc(sl()));

//__________________________________
  sl.registerSingleton<CategoriesServiceImp>(CategoriesServiceImp(dio: Dio()));
  sl.registerSingleton<CategoryRepoImpl>(
      CategoryRepoImpl(categoriesServiceImp: sl()));

  sl.registerSingleton<CategoryUseCase>(
      CategoryUseCase(categoryRepoImpl: sl()));

  sl.registerFactory<CategoryBloc>(() => CategoryBloc(sl()));

  sl.registerSingleton<BicycleUseCase>(BicycleUseCase(categoryRepoImpl: sl()));

  sl.registerFactory<BicycleBloc>(() => BicycleBloc(sl()));
  //___________________________________
  sl.registerSingleton<HubContentServiceImp>(HubContentServiceImp(dio: sl()));

  sl.registerSingleton<HubContenRepoImpl>(
      HubContenRepoImpl(hubContentServiceImp: sl()));

  sl.registerSingleton<GetHubContentsUseCase>(
      GetHubContentsUseCase(hubContenRepoImpl: sl()));
  sl.registerFactory<HubContentsBloc>(() => HubContentsBloc(sl()));
//_____________________________________

  sl.registerSingleton<HubServiceImp>(HubServiceImp(dio: sl()));

  sl.registerSingleton<HubRepoImpl>(HubRepoImpl(hubServiceImp: sl()));

  sl.registerSingleton<HubUseCase>(HubUseCase(hubRepoImpl: sl()));

  sl.registerFactory<HubBloc>(() => HubBloc(sl()));
//____________________________________
  sl.registerSingleton<ReservationServiceImp>(ReservationServiceImp(dio: sl()));

  sl.registerSingleton<ReservationRepoImpl>(
      ReservationRepoImpl(reservationServiceImp: sl()));

  sl.registerSingleton<ReservationUseCase>(
      ReservationUseCase(reservationRepoImpl: sl()));

  sl.registerFactory<ReservationBloc>(() => ReservationBloc(sl()));
  //________________________________
  sl.registerSingleton<policyServiceImp>(policyServiceImp(dio: sl()));

  sl.registerSingleton<policyRepoImpl>(policyRepoImpl(policServiceImp: sl()));

  sl.registerSingleton<policyUseCase>(policyUseCase(policRepoImpl: sl()));

  sl.registerFactory<policyBloc>(() => policyBloc(sl()));
  //====================
  sl.registerSingleton<putpolicyUseCase>(putpolicyUseCase(policRepoImpl: sl()));

  sl.registerFactory<putpolicyBloc>(() => putpolicyBloc(sl()));
  //________________________________
  sl.registerSingleton<changepasswordServiceImp>(
      changepasswordServiceImp(dio: sl()));

  sl.registerSingleton<changepasswordRepoImpl>(
      changepasswordRepoImpl(changepassworServiceImp: sl()));

  sl.registerSingleton<changepasswordUseCase>(
      changepasswordUseCase(changepassworImpl: sl()));

  sl.registerFactory<changepasswordBloc>(() => changepasswordBloc(sl()));
  //_______________________________

  sl.registerSingleton<WalletCreationServiceImp>(
      WalletCreationServiceImp(dio: sl()));

  sl.registerSingleton<WalletCreationRepoImpl>(
      WalletCreationRepoImpl(walletCreationServiceImp: sl()));

  sl.registerSingleton<WalletCreationUseCase>(
      WalletCreationUseCase(walletCreationRepoImp: sl()));

  sl.registerFactory<WalletCreationBloc>(() => WalletCreationBloc(sl()));

  //___________________________________________

  sl.registerSingleton<WalletInfoServiceImp>(WalletInfoServiceImp(dio: sl()));

  sl.registerSingleton<WalletInfoRepoImp>(
      WalletInfoRepoImp(walletInfoServiceImp: sl()));

  sl.registerSingleton<WalletInfoUseCase>(
      WalletInfoUseCase(walletInfoRepoImp: sl()));

  sl.registerFactory<WalletInfoBloc>(() => WalletInfoBloc(sl()));
}
