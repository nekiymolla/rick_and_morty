import 'dart:convert';

import 'package:flutter_application_1/core/errors/errors.dart';

import '../models/models.dart';
import 'package:dio/dio.dart';

abstract class PersonRemoteDatasource {
  Future<List<PersonModel>> getPersons(int page);
}

class PersonRemoteDatasourceImpl implements PersonRemoteDatasource {
  final Dio dio;
  PersonRemoteDatasourceImpl({required this.dio});
  @override
  Future<List<PersonModel>> getPersons(int page) async {
    final response = await dio.get(
      'https://rickandmortyapi.com/api/character?page=$page',
      queryParameters: {'content-type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final persons = jsonDecode(response.data)['results'] as List;
      return persons.map((e) => PersonModel.fromJson(e)).toList();
    } else {
      throw ServerExceptions();
    }
  }
}
