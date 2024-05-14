import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/errors/error.dart';
import 'package:flutter_application_1/core/errors/usecases.dart';
import 'package:flutter_application_1/feature/domain/entities/person_entity.dart';
import 'package:flutter_application_1/feature/domain/repository/person_repository.dart';

class GetPersonsUseCase extends UseCases<List<PersonEntity>, PersonIdParams> {
  final PersonRepository personRepository;
  GetPersonsUseCase(this.personRepository);
  @override
  Future<Either<Failure, List<PersonEntity>>> call(
      PersonIdParams params) async {
    return await personRepository.getPersons(params.page);
  }
}

class PersonIdParams extends Equatable {
  final int page;

  const PersonIdParams({required this.page});
  @override
  List<Object?> get props => [page];
}
