import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/error.dart';
import 'package:flutter_application_1/feature/domain/entities/person_entity.dart';
import 'package:flutter_application_1/feature/domain/repository/person_repository.dart';

class GetPersonsUseCase {
  final PersonRepository personRepository;
  GetPersonsUseCase(this.personRepository);
  Future<Either<Failure, List<PersonEntity>>> call(int page) async {
    return await personRepository.getPersons(page);
  }
}
