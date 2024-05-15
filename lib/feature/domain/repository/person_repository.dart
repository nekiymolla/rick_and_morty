import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/error.dart';
import 'package:flutter_application_1/feature/domain/entities/person_entity.dart';

abstract class PersonRepository {
  Future<Either<Failure, List<PersonEntity>>> getPersons(int page);
}
