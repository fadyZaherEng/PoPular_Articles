import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:most_popular_articales/data/data_source/local_data_source.dart';
import 'package:most_popular_articales/data/data_source/remote_data_source.dart';
import 'package:most_popular_articales/data/network/app_api.dart';
import 'package:most_popular_articales/data/network/dio_factory.dart';
import 'package:most_popular_articales/data/network/network_info.dart';
import 'package:most_popular_articales/data/repository/repository_impl.dart';
import 'package:most_popular_articales/domain/repository/repository.dart';
import 'package:most_popular_articales/domain/usecase/home_usecase.dart';

//get_it for di
//dartz for either

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // network info
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));
  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  Dio dio = await instance<DioFactory>().getDio();
  //app service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(instance<AppServiceClient>()));
  // local data source
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
  // repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance(), instance(),instance()));
}
initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
  }
}

