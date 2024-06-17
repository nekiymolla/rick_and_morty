import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/error.dart';

abstract class UseCases<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
