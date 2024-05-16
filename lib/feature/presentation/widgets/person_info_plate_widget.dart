import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/domain/entities/person_entity.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/app_colors.dart';

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
      child: PersonInfoPlateBody(
        person: person,
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
      children: [],
    );
  }
}
