import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/common/text_styles.dart';
import 'package:flutter_application_1/feature/domain/entities/person_entity.dart';

class StatusPersonWidget extends StatelessWidget {
  final PersonEntity person;
  const StatusPersonWidget({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: person.status == 'Alive'
                ? AppColors.statusAlive
                : person.status == 'Dead'
                    ? AppColors.statusDead
                    : AppColors.statusUnknown,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          '${person.status} - ${person.gender}',
          style: TextStyles.statusText,
        )
      ],
    );
  }
}
