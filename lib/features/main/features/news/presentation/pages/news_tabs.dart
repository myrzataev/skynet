import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skynet/core/consts/app_fonts.dart';
import 'package:skynet/features/authorization/presentation/screens/connectivity_widget.dart';
import 'package:skynet/features/main/features/home/presentation/providers/check_internet_connection.dart';
import 'package:skynet/features/main/features/news/presentation/pages/common_news_page.dart';
import 'package:skynet/features/main/features/news/presentation/pages/personal_news_page.dart';


@RoutePage()
class NewsPage extends StatefulWidget {
  const NewsPage({required Key key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return ConnectivityOverlay(
      isConnected: context.watch<CheckInternetConnectionProvider>().isConnected,
      child: Scaffold(
        
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xffFD4417),
              Color(0xffEC0478),
            ])),
          ),
          title:  Text('Новости Skynet',style: AppFonts.s20w500.copyWith(color: Colors.white),),
          bottom: TabBar(
            controller: tabController,
            tabs:  [
              Tab(
                child: Text(
                  "Новости",
                  
                  selectionColor: Colors.white,
                  style: AppFonts.s14w500.copyWith(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  "Мои новости",
                  selectionColor: Colors.white,
                  style:  AppFonts.s14w500.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        
        body: 
        TabBarView(
          controller: tabController,
          children: const [
            Center(
              child: CommonNewsPage()
            ),
            Center(
              child: PersonalNewsPage(),
            ),
          ],
        ),
      ),
    );
  }
}
