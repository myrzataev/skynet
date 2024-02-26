import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skynet/presentation/screens/home_page.dart';
import 'package:skynet/presentation/screens/news_page.dart';
import 'package:skynet/presentation/widgets/bottom_navbar.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: BottomNavbarRoute.page, initial: true, children: [
          AutoRoute(page: HomeRoute.page, initial: true, children: [
            // AutoRoute(
            //   page: TransactionsRoute.page,
            // ),
          ]),
          AutoRoute(
            page: NewsRoute.page,
          ),
        ]),
        // AutoRoute(page: MyStoryRoute.page, initial:
        // true

        // )
      ];
}
