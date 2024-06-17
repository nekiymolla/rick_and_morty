import 'dart:convert';

import 'package:flutter_application_1/core/errors/exceptions.dart';
import 'package:flutter_application_1/feature/data/models/person_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PersonLocalDataSources {
  Future<List<PersonModel>> personsFromCashe();
  Future<void> personsToCashe(List<PersonModel> cachedPersons);
}

class PersonLocalDataSourcesImpl implements PersonLocalDataSources {
  final SharedPreferences sharedPreferences;
  PersonLocalDataSourcesImpl({required this.sharedPreferences});
  @override
  Future<List<PersonModel>> personsFromCashe() {
    final cachedPersonsList =
        sharedPreferences.getStringList('CACHED_PERSONS_LIST');
    if (cachedPersonsList != null) {
      return Future.value(cachedPersonsList
          .map((e) => PersonModel.fromJson(jsonDecode(e)))
          .toList());
    } else {
      throw EmptyCacheExceptions();
    }
  }

  @override
  Future<void> personsToCashe(List<PersonModel> cachedPersons) {
    final List<String> cachedPersonsList = cachedPersons
        .map((e) => json.encode(
              e.toJson(),
            ))
        .toList();
    sharedPreferences.setStringList('CACHED_PERSONS_LIST', cachedPersonsList);
    // ignore: void_checks
    return Future.value(cachedPersonsList);
  }
}
