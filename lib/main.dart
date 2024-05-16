import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/presentation/bloc/person_list_cubit.dart';
import 'package:flutter_application_1/feature/presentation/pages/persons_list_page.dart';
import 'package:flutter_application_1/injector.dart' as di;
import 'package:flutter_application_1/injector.dart';
import 'package:flutter_application_1/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const RickAndMortyApp());
}

class RickAndMortyApp extends StatefulWidget {
  const RickAndMortyApp({super.key});

  @override
  State<RickAndMortyApp> createState() => _RickAndMortyAppState();
}

class _RickAndMortyAppState extends State<RickAndMortyApp> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersonListCubit>(
          create: (context) => injector<PersonListCubit>()..loadPersons(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
        // home: PersonsListPage(),
      ),
    );
  }
}
