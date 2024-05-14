import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/loading_indicator.dart';
import '../../domain/entities/entities.dart';
import '../bloc/person_list_cubit.dart';
import '../bloc/person_list_state.dart';

class PersonsListWidget extends StatelessWidget {
  PersonsListWidget({super.key});
  final scrollController = ScrollController();
  void setupScrollController(BuildContext context) {
    scrollController.addListener(
      () {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels != 0) {
            // BlocProvider.of<PersonListCubit>(context).loadPerson();
            context.read<PersonListCubit>().loadPersons();
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonListCubit, PersonState>(builder: (context, state) {
      bool isLoading = false;
      List<PersonEntity> persons = [];
      if (state is PersonLoading && state.isFirtstFetch) {
        loadingIndicator();
      } else if (state is PersonLoaded) {
        persons = state.personsList;
      } else if (state is PersonError) {
        //TODO: add error message
      } else if (state is PersonLoading) {
        persons = state.oldPersonsList;
        isLoading = true;
      }
      return ListView.builder(
        controller: scrollController,
        itemCount: persons.length + (isLoading ? 1 : 0),
        itemBuilder: (context, index) => Container(),
      );
    });
  }
}
