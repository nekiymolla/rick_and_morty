import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/domain/entities/person_entity.dart';
import 'package:flutter_application_1/feature/presentation/widgets/status_person_widget.dart';

import '../../../common/app_colors.dart';
import '../../../common/text_styles.dart';

class PersonInfoPlateWidget extends StatelessWidget {
  final PersonEntity person;
  const PersonInfoPlateWidget({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.plateColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Expanded(
        child: PersonInfoPlateBody(
          person: person,
        ),
      ),
    );
  }
}

class PersonInfoPlateBody extends StatelessWidget {
  final PersonEntity person;

  const PersonInfoPlateBody({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(person.name, style: TextStyles.mainText),
        const SizedBox(height: 5),
        StatusPersonWidget(
          person: person,
        ),
        const SizedBox(height: 5),
        Text(
          'Сущность: ${person.species}',
          style: TextStyles.descriptionText,
        ),
        const SizedBox(height: 5),
        Text(
          'Эпизоды: ${person.episode.length}',
          style: TextStyles.descriptionText,
        ),
        const SizedBox(height: 5),
        Text(
          'Откуда: ${person.location.name}',
          style: TextStyles.descriptionText,
        ),
        const SizedBox(height: 5),
        Text(
          'Место нахождения: ${person.origin.name}',
          style: TextStyles.descriptionText,
        ),
      ],
    );
  }
}
