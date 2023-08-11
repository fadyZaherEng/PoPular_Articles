import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:most_popular_articales/data/data_source/local_data_source.dart';
import 'package:most_popular_articales/data/data_source/remote_data_source.dart';
import 'package:most_popular_articales/data/network/network_info.dart';
import 'package:most_popular_articales/data/repository/repository_impl.dart';
import 'package:most_popular_articales/domain/repository/repository.dart';
import 'package:most_popular_articales/domain/usecase/home_usecase.dart';


final instance = GetIt.instance;

Future<void> initAppModule() async {

  // network info
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));
  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

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

