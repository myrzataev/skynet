import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skynet/modules/authorization/presentation/screens/authorization_screen.dart';
import 'package:skynet/modules/home/presentation/screens/home_page.dart';
import 'package:skynet/modules/home/presentation/screens/more_page.dart';
import 'package:skynet/modules/home/presentation/screens/navigation/home_page_navigation.dart';
import 'package:skynet/modules/home/presentation/screens/navigation/more_navigation.dart';
import 'package:skynet/modules/home/presentation/screens/navigation/news_page_navigation.dart';
import 'package:skynet/modules/home/presentation/screens/news_page.dart';
import 'package:skynet/modules/home/presentation/widgets/bottom_navbar.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // AutoRoute(page: BottomNavbarRoute.page, initial: true, children: [
        //   AutoRoute(page: HomeRouteNavigation.page, children: [
        //     AutoRoute(
        //       page: HomeRoute.page,
        //     )
        //   ]),
        //   AutoRoute(page: NewsRouteNavigation.page, children: [
        //     AutoRoute(
        //       page: NewsRoute.page,
        //     )
        //   ]),
        //   AutoRoute(page: MoreNavigationRoute.page, children: [
        //     AutoRoute(
        //       page: MoreRoute.page,
        //     )
        //   ])
        // ])

        AutoRoute(page: AuthorizationRoute.page, initial: true)
      ];
}
