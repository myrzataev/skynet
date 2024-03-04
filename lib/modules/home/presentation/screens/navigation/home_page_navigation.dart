import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
@RoutePage()
class HomePageNavigation extends StatelessWidget {
  const HomePageNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}