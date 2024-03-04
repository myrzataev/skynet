import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skynet/core/routes/app_router.dart';
import 'package:skynet/resources/resources.dart';

@RoutePage()
class BottomNavbarPage extends StatelessWidget {
  const BottomNavbarPage({super.key});
  static const List<BottomNavigationBarItem> _bottomNavbarsItems = [
    BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(Images.frame3)), label: "Главная"),
    BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(Images.newsunabled)), label: "Новости"),
            BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(Images.more)), label: "Еще"),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes:  [HomeRoute(), const NewsRoute(), const MoreRoute()],
      bottomNavigationBuilder: (_, tabsRouter) => BottomNavigationBar(
        // iconSize: 15,
        backgroundColor: const Color(0xffFCE6F1),
        items: _bottomNavbarsItems,
        unselectedItemColor: const Color(0xff808080),
        selectedItemColor: Colors.red,
        currentIndex: tabsRouter.activeIndex,
        onTap: (int i) {
          tabsRouter.setActiveIndex(i);
        },
      ),
    );
  }
}
