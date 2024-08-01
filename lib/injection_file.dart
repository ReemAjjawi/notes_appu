
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {


  
  sl.registerSingleton<Dio>(Dio());


//   sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

//   sl.registerSingleton<ArticleRepository>(
//     ArticleRepositoryImpl(sl(),sl())
//   );
  
//   //UseCases
//   sl.registerSingleton<GetArticleUseCase>(
//     GetArticleUseCase(sl())
//   );

//   sl.registerSingleton<GetSavedArticleUseCase>(
//     GetSavedArticleUseCase(sl())
//   );

//   sl.registerSingleton<SaveArticleUseCase>(
//     SaveArticleUseCase(sl())
//   );
  
//   sl.registerSingleton<RemoveArticleUseCase>(
//     RemoveArticleUseCase(sl())
//   );


//   //Blocs
//   sl.registerFactory<RemoteArticlesBloc>(
//     ()=> RemoteArticlesBloc(sl())
//   );

//   sl.registerFactory<LocalArticleBloc>(
//     ()=> LocalArticleBloc(sl(),sl(),sl())
//   );


 }