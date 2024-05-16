import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/presentation/pages/person_info_page.dart';

import '../feature/domain/entities/entities.dart';
import '../feature/presentation/pages/persons_list_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: PersonsListRoute.page,
        ),
        AutoRoute(
          page: PersonInfoRoute.page,
        ),
      ];
}
