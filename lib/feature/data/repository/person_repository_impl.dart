import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/feature/domain/entities/person_entity.dart';

import '../../../core/errors/errors.dart';
import '../../domain/repository/person_repository.dart';

class PersonRepositoryImpl implements PersonRepository {
  @override
  Future<Either<Failure, List<PersonEntity>>> getPersons(int page) async {
    throw UnimplementedError();
  }
}
