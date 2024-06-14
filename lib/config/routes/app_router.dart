import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:skynet/features/main/features/home/domain/entity/application_status_entity.dart';
import 'package:skynet/features/main/features/home/presentation/pages/application_status_screen.dart';
import 'package:skynet/main.dart';
import 'package:skynet/features/authorization/presentation/screens/agreement_screen.dart';

import 'package:skynet/features/authorization/presentation/screens/authorization_screen.dart';
import 'package:skynet/features/authorization/presentation/screens/confirm_code_screen.dart';
import 'package:skynet/features/authorization/presentation/screens/splash_screen.dart';
import 'package:skynet/features/main/features/home/presentation/pages/bottom_navbar.dart';
import 'package:skynet/features/main/features/news/presentation/pages/read_news_from_notification.dart';
import 'package:skynet/features/main/features/news/presentation/pages/read_news_page.dart';

final GoRouter appRoutes = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: "/",
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    // routes: <RouteBase>[
    GoRoute(
      name: "authorization",
      path: "/authorization",
      builder: (BuildContext context, GoRouterState state) {
        return const AuthorizationScreen();
      },
    ),
    GoRoute(
        name: "confirmCode",
        path: "/confirmCode/:phoneNumber",
        builder: (BuildContext context, GoRouterState state) {
          final phoneNumber = state.pathParameters["phoneNumber"];
          return ConfirmCodeScreen(phoneNumber: phoneNumber ?? "");
        },
        routes: [
          GoRoute(
            name: "agreement",
            path: "agreement",
            builder: (context, state) {
              return const AgreeTermsScreen();
            },
          ),
        ]),

    GoRoute(
        name: "bottomNavigation",
        path: "/bottomNavigation",
        builder: (context, state) {
          return const BottomNavbarPage();
        },
        routes: [
          GoRoute(
            name: "readNews",
            path: "readNews/:newsTitle/:text/:image/:postId/:postType",
            builder: (context, state) {
              final text = state.pathParameters["text"];
              final newsTitle = state.pathParameters["newsTitle"];
              final image = state.pathParameters["image"];
              final postId = state.pathParameters["postId"];
              final postType = state.pathParameters["postType"];

              return ReadNewsPage(
                newsTitle: newsTitle ?? "",
                text: text ?? "",
                image: image ?? "",
                postId: postId ?? "",
                postType: postType ?? "",
              );
            },
          ),
          GoRoute(
            path: "readNewsFromNotification/:title/:body",
            builder: (context, state) {
              final body = state.pathParameters["body"];
              final title = state.pathParameters["title"];
              return ReadNewsPageFromNotification(
                title: title ?? "",
                body: body ?? "",
              );
            },
          ),
          GoRoute(
            path: "applicationStatusScreen",
            builder: (context, state) {
              ApplicationStatusEntity model =
                  state.extra as ApplicationStatusEntity;
              return ApplicationStatusScreen(model: model);
            },
          )
        ]),
  ],
);
