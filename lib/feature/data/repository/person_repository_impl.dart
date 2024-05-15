import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/platform/internet_checker.dart';
import 'package:flutter_application_1/feature/data/datasources/person_local_datasources.dart';
import 'package:flutter_application_1/feature/data/datasources/person_remote_datasources.dart';
import 'package:flutter_application_1/feature/domain/entities/person_entity.dart';

import '../../../core/errors/errors.dart';
import '../../domain/repository/person_repository.dart';

class PersonRepositoryImpl implements PersonRepository {
  final PersonRemoteDatasource remoteDataSource;
  final PersonLocalDataSources localDataSource;
  final NetworkInfo networkInfo;

  PersonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<PersonEntity>>> getPersons(int page) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePerson = await remoteDataSource.getPersons(page);
        localDataSource.personsToCashe(remotePerson);
        return Right(remotePerson);
      } on ServerExceptions {
        return Left(ServerFailure());
      }
    } else {
      try {
        final locationPerson = await localDataSource.personsFromCashe();
        return Right(locationPerson);
      } on EmptyCacheExceptions {
        return Left(CacheFailure());
      }
    }
  }
}
