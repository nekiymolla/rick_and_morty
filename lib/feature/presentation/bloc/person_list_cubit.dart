import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/errors/error.dart';
import '../../domain/entities/entities.dart';
import '../../domain/usecases/get_persons_usecase.dart';
import 'person_list_state.dart';

class PersonListCubit extends Cubit<PersonState> {
  final GetPersonsUseCase getPersonsUseCase;
  PersonListCubit({required this.getPersonsUseCase}) : super(PersonEmpty());

  void loadPersons() async {
    if (state is PersonLoading) return;
    final currentState = state;
    var oldPerson = <PersonEntity>[];
    int page = 1;
    if (currentState is PersonLoaded) {
      oldPerson = currentState.personsList;
    }
    emit(PersonLoading(oldPerson, isFirtstFetch: page == 1));

    final failureOrPerson = await getPersonsUseCase(PersonIdParams(page: page));
    failureOrPerson
        .fold((error) => PersonError(message: _mapFailureToMessage(error)),
            (character) {
      page++;
      final persons = (state as PersonLoading).oldPersonsList;
      persons.addAll(character);
      emit(PersonLoaded(persons));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case CacheFailure:
        return 'Cache Failure';
      default:
        return 'Unexpected Error';
    }
  }
}
