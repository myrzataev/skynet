// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthorizationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthorizationScreen(),
      );
    },
    BottomNavbarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BottomNavbarPage(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePage(key: args.key),
      );
    },
    HomeRouteNavigation.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePageNavigation(),
      );
    },
    MoreNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MoreNavigationPage(),
      );
    },
    MoreRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MorePage(),
      );
    },
    NewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsPage(),
      );
    },
    NewsRouteNavigation.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsPageNavigation(),
      );
    },
  };
}

/// generated route for
/// [AuthorizationScreen]
class AuthorizationRoute extends PageRouteInfo<void> {
  const AuthorizationRoute({List<PageRouteInfo>? children})
      : super(
          AuthorizationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthorizationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BottomNavbarPage]
class BottomNavbarRoute extends PageRouteInfo<void> {
  const BottomNavbarRoute({List<PageRouteInfo>? children})
      : super(
          BottomNavbarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavbarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [HomePageNavigation]
class HomeRouteNavigation extends PageRouteInfo<void> {
  const HomeRouteNavigation({List<PageRouteInfo>? children})
      : super(
          HomeRouteNavigation.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouteNavigation';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MoreNavigationPage]
class MoreNavigationRoute extends PageRouteInfo<void> {
  const MoreNavigationRoute({List<PageRouteInfo>? children})
      : super(
          MoreNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoreNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MorePage]
class MoreRoute extends PageRouteInfo<void> {
  const MoreRoute({List<PageRouteInfo>? children})
      : super(
          MoreRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoreRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsPage]
class NewsRoute extends PageRouteInfo<void> {
  const NewsRoute({List<PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsPageNavigation]
class NewsRouteNavigation extends PageRouteInfo<void> {
  const NewsRouteNavigation({List<PageRouteInfo>? children})
      : super(
          NewsRouteNavigation.name,
          initialChildren: children,
        );

  static const String name = 'NewsRouteNavigation';

  static const PageInfo<void> page = PageInfo<void>(name);
}
