import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/persons_list_widget.dart';

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
