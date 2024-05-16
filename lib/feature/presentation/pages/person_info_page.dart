import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/domain/entities/person_entity.dart';
import 'package:flutter_application_1/feature/presentation/widgets/person_info_page_body.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class PersonInfoPage extends StatelessWidget {
  final PersonEntity person;
  const PersonInfoPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          backgroundColor: Colors.transparent,
          title: SvgPicture.asset(
            'assets/icons/logo.svg',
            semanticsLabel: 'logo',
          ),
        ),
        backgroundColor: Colors.transparent,
        body: PersonInfoPageBody(
          person: person,
        ),
      ),
    );
  }
}
