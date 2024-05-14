import 'package:flutter/material.dart';
import '../widgets/persons_list_widget.dart';

class PersonsListPage extends StatelessWidget {
  const PersonsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello app'),
      ),
      body: PersonsListWidget(),
    );
  }
}
