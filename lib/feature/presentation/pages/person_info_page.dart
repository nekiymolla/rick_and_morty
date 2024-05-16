import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/domain/entities/person_entity.dart';

@RoutePage()
class PersonInfoPage extends StatelessWidget {
  final PersonEntity person;
  const PersonInfoPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
