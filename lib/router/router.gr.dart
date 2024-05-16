// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    PersonInfoRoute.name: (routeData) {
      final args = routeData.argsAs<PersonInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PersonInfoPage(
          key: args.key,
          person: args.person,
        ),
      );
    },
    PersonsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PersonsListPage(),
      );
    },
  };
}

/// generated route for
/// [PersonInfoPage]
class PersonInfoRoute extends PageRouteInfo<PersonInfoRouteArgs> {
  PersonInfoRoute({
    Key? key,
    required PersonEntity person,
    List<PageRouteInfo>? children,
  }) : super(
          PersonInfoRoute.name,
          args: PersonInfoRouteArgs(
            key: key,
            person: person,
          ),
          initialChildren: children,
        );

  static const String name = 'PersonInfoRoute';

  static const PageInfo<PersonInfoRouteArgs> page =
      PageInfo<PersonInfoRouteArgs>(name);
}

class PersonInfoRouteArgs {
  const PersonInfoRouteArgs({
    this.key,
    required this.person,
  });

  final Key? key;

  final PersonEntity person;

  @override
  String toString() {
    return 'PersonInfoRouteArgs{key: $key, person: $person}';
  }
}

/// generated route for
/// [PersonsListPage]
class PersonsListRoute extends PageRouteInfo<void> {
  const PersonsListRoute({List<PageRouteInfo>? children})
      : super(
          PersonsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
