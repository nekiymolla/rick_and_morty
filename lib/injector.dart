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

final injector = GetIt.instance;

Future<void> init() async {
  //Cubit
  injector.registerFactory(
    () => PersonListCubit(getPersonsUseCase: injector()),
  );
  //UseCases
  injector.registerLazySingleton(
    () => GetPersonsUseCase(injector()),
  );
  //Repository
  injector.registerLazySingleton<PersonRepository>(
    () => PersonRepositoryImpl(
      remoteDataSource: injector(),
      localDataSource: injector(),
      networkInfo: injector(),
    ),
  );
  injector.registerLazySingleton<PersonRemoteDatasource>(
    () => PersonRemoteDatasourceImpl(dio: injector()),
  );
  injector.registerLazySingleton<PersonLocalDataSources>(
    () => PersonLocalDataSourcesImpl(sharedPreferences: injector()),
  );
  //Core
  injector.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(injector()),
  );
  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton(() => Dio());
  injector.registerLazySingleton(() => InternetConnectionChecker());
  injector.registerLazySingleton(() => sharedPreferences);
}
