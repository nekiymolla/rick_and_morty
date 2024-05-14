import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/platform/internet_checker.dart';
import 'feature/data/datasources/person_local_datasources.dart';
import 'feature/data/datasources/person_remote_datasources.dart';
import 'feature/data/repository/person_repository_impl.dart';
import 'feature/domain/repository/person_repository.dart';
import 'feature/domain/usecases/get_persons_usecase.dart';
import 'feature/presentation/bloc/person_list_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Cubit
  sl.registerFactory(
    () => PersonListCubit(getPersonsUseCase: sl()),
  );
  //UseCases
  sl.registerLazySingleton(
    () => GetPersonsUseCase(sl()),
  );
  //Repository
  sl.registerLazySingleton<PersonRepository>(
    () => PersonRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<PersonRemoteDatasource>(
    () => PersonRemoteDatasourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<PersonLocalDataSources>(
    () => PersonLocalDataSourcesImpl(sharedPreferences: sl()),
  );
  //Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );
  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => sharedPreferences);
}
