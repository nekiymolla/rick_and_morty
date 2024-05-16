import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/persons_list_widget.dart';

@RoutePage()
class PersonsListPage extends StatelessWidget {
  const PersonsListPage({super.key});

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
          centerTitle: true,
          toolbarHeight: 90,
          backgroundColor: Colors.transparent,
          title: SvgPicture.asset(
            'assets/icons/logo.svg',
            semanticsLabel: 'logo',
          ),
        ),
        backgroundColor: Colors.transparent,
        body: PersonsListWidget(),
      ),
    );
  }
}
