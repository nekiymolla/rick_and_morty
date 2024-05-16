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
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PersonInfoPage(),
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
class PersonInfoRoute extends PageRouteInfo<void> {
  const PersonInfoRoute({List<PageRouteInfo>? children})
      : super(
          PersonInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
