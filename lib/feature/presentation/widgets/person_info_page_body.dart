import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/presentation/widgets/person_info_plate_widget.dart';

import '../../domain/entities/entities.dart';

class PersonInfoPageBody extends StatelessWidget {
  final PersonEntity person;
  const PersonInfoPageBody({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: Column(
        children: [
          PersonInfoPlateImage(person: person),
          const SizedBox(height: 10),
          PersonInfoPlateBody(person: person)
        ],
      ),
    );
  }
}

class PersonInfoPlateImage extends StatelessWidget {
  final PersonEntity person;
  const PersonInfoPlateImage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/pictures/portal.png'),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          65,
        ),
        child: Center(
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: person.image,
              height: 180,
              width: 180,
            ),
          ),
        ),
      ),
    );
  }
}
