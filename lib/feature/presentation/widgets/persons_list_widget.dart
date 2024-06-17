import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/presentation/widgets/person_plate_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/app_colors.dart';
import '../../../common/text_styles.dart';
import '../../../core/widgets/loading_indicator.dart';
import '../../../generated/l10n.dart';
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
        return loadingIndicator();
      } else if (state is PersonLoaded) {
        persons = state.personsList;
      } else if (state is PersonError) {
        return const ErrorPageWidget();
      } else if (state is PersonLoading) {
        persons = state.oldPersonsList;
        isLoading = true;
      }
      return ListView.builder(
        controller: scrollController,
        itemCount: persons.length + (isLoading ? 1 : 0),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
            top: 10,
          ),
          child: PersonPlateWidget(
            person: persons[index],
          ),
        ),
      );
    });
  }
}

class ErrorPageWidget extends StatelessWidget {
  const ErrorPageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            l10n.somethingWentWrong,
            style: TextStyles.mainText,
          ),
          const SizedBox(height: 10),
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () => context.read<PersonListCubit>().loadPersons(),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.plateColor,
                borderRadius: BorderRadius.circular(
                  16,
                ),
              ),
              child: Text(
                l10n.tryAgain,
                style: TextStyles.mainText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
