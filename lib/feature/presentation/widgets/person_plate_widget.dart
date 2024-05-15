import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/feature/domain/entities/person_entity.dart';
import 'package:flutter_application_1/feature/presentation/widgets/person_cached_image_widget.dart';
import 'package:flutter_application_1/feature/presentation/widgets/status_person_widget.dart';

import '../../../common/text_styles.dart';

class PersonPlateWidget extends StatelessWidget {
  final PersonEntity person;

  const PersonPlateWidget({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.plateColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: PersonPlateBody(person: person),
    );
  }
}

class PersonPlateBody extends StatelessWidget {
  const PersonPlateBody({
    super.key,
    required this.person,
  });

  final PersonEntity person;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          PersonCacheImage(
            imageUrl: person.image,
            width: 72,
            height: 72,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: PlatePersonInfo(
              person: person,
            ),
          ),
        ],
      ),
    );
  }
}

class PlatePersonInfo extends StatelessWidget {
  final PersonEntity person;

  const PlatePersonInfo({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          person.name,
          style: TextStyles.mainText,
        ),
        StatusPersonWidget(person: person),
      ],
    );
  }
}
