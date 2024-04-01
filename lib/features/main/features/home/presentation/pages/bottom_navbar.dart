import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skynet/features/main/features/home/presentation/pages/home_page.dart';
import 'package:skynet/features/main/features/profile/presentation/pages/more_page.dart';
import 'package:skynet/features/main/features/news/presentation/pages/news_tabs.dart';
import 'package:skynet/resources/resources.dart';

class BottomNavbarPage extends StatefulWidget {
  const BottomNavbarPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavbarPageState createState() => _BottomNavbarPageState();
}

class _BottomNavbarPageState extends State<BottomNavbarPage> {
  int _selectedIndex = 0;

  // Define your pages here. Each page is wrapped with a key to uniquely identify it.
  final List<Widget> _pages = [
    const HomePage(key: PageStorageKey('HomePage')),
    const NewsPage(key: PageStorageKey('NewsPage')),
    const MorePage(key: PageStorageKey("MorePage"))

    // Add more pages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                const AssetImage(Images.frame3),
                size: 22.h,
              ),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  const AssetImage(
                    Images.newsunabled,
                  ),
                  size: 22.h,
                ),
                label: 'Новости'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  const AssetImage(Images.dots),
                  size: 22.h,
                ),
                label: "Еще")
            // Add more items as needed
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ));
  }
}
