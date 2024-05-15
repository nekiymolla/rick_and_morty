import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/presentation/bloc/person_list_cubit.dart';
import 'package:flutter_application_1/feature/presentation/pages/persons_list_page.dart';
import 'package:flutter_application_1/injector.dart' as di;
import 'package:flutter_application_1/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const RickAndMortyApp());
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersonListCubit>(
          create: (context) => injector<PersonListCubit>()..loadPersons(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PersonsListPage(),
      ),
    );
  }
}
