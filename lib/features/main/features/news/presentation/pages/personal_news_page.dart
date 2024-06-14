import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/core/services/shared_preferences_provider.dart';
import 'package:skynet/features/main/features/home/presentation/providers/viewed_news_list.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/custom_error_widget.dart';
import 'package:skynet/features/main/features/news/presentation/blocs/personal_news/personal_news_bloc.dart';
import 'package:skynet/features/main/features/news/presentation/pages/read_news_page.dart';
import 'package:skynet/features/main/features/news/presentation/widgets/news_card.dart';

class PersonalNewsPage extends StatefulWidget {
  const PersonalNewsPage({super.key});

  @override
  State<PersonalNewsPage> createState() => _PersonalNewsPageState();
}

class _PersonalNewsPageState extends State<PersonalNewsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final SharedPreferences prefs = SharedPreferencesRepository().prefs;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PersonalNewsBloc>(context).add(GetPersonalNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<PersonalNewsBloc>(context)
                      .add(GetPersonalNewsEvent());
                },
                child: BlocBuilder<PersonalNewsBloc, PersonalNewsState>(
                  builder: (context, state) {
                    if (state is PersonalNewsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is PersonalNewsSuccess) {
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: state.model.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  context
                                      .read<ViewedNewsProvider>()
                                      .addToViewedNewsList(
                                          data:
                                              state.model[index].id.toString());
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ReadNewsPage(
                                              newsTitle:
                                                  state.model[index].title ??
                                                      "",
                                              text:
                                                  state.model[index].text ?? "",
                                              image: state.model[index].image ??
                                                  "",
                                              postId: state.model[index].id
                                                  .toString(),
                                              postType:
                                                  state.model[index].postType ??
                                                      "",
                                            )));
                              },
                              child: CustomNewsCard(
                                 isRead: prefs
                                        .getStringList("viewedNewsList")
                                        ?.contains(state.model[index].id.toString()) ??
                                    false,
                                title: state.model[index].title ?? "",
                                image: state.model[index].image ?? "",
                                news: state.model[index].text ?? "",
                                date: state.model[index].createdAt.toString(),
                              ),
                            );
                          });
                    } else if (state is PersonalNewsError) {
                      return Center(
                        child: CustomErrorWidget(
                          onTap: () {
                            setState(() {
                              BlocProvider.of<PersonalNewsBloc>(context)
                                  .add(GetPersonalNewsEvent());
                            });
                          },
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
