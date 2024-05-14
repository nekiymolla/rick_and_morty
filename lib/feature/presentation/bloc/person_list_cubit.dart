import 'package:flutter_application_1/feature/domain/usecases/get_persons_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/errors/errors.dart';
import '../../domain/entities/entities.dart';
import 'person_list_state.dart';

class PersonListCubit extends Cubit<PersonState> {
  final GetPersonsUseCase getPersonsUseCase;
  PersonListCubit({required this.getPersonsUseCase}) : super(PersonEmpty());
  void loadPersons(int page) async {
    int page = 1;
    final currentState = state;
    var oldPerson = <PersonEntity>[];
    final failureOrPerson =
        await getPersonsUseCase.call(PersonIdParams(page: page));
    failureOrPerson.fold(
      (failure) => PersonError(message: _mapFailureToMessage(failure)),
      (person) {
        page++;
        final persons = (state as PersonLoading).oldPersonsList;
        persons.addAll(person);
        emit(PersonLoaded(persons));
      },
    );
    if (state is PersonLoading) return;
    if (currentState is PersonLoaded) {
      oldPerson = currentState.personsList;
    }
    emit(PersonLoading(oldPerson, isFirtstFetch: page == 1));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure():
        return 'Server Failure';
      case CacheFailure():
        return 'Cache Failure';
      default:
        return 'Unexpected Error';
    }
  }
}
