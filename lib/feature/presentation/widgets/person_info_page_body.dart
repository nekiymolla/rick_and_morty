import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
        children: [PersonInfoPlateImage(person: person)],
      ),
    );
  }
}

class PersonInfoPlateImage extends StatelessWidget {
  final PersonEntity person;
  const PersonInfoPlateImage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return const Stack(children: [
      Image(
        image: AssetImage(
          'assets/pictures/portal.png',
        ),
      ),
    ]);
  }
}
