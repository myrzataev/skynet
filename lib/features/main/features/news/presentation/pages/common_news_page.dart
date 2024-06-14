import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/core/services/shared_preferences_provider.dart';
import 'package:skynet/features/main/features/home/presentation/providers/viewed_news_list.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/custom_error_widget.dart';
import 'package:skynet/features/main/features/news/presentation/blocs/cubit/mark_as_viewed_cubit.dart';
import 'package:skynet/features/main/features/news/presentation/blocs/news_bloc/new_list_bloc.dart';
import 'package:skynet/features/main/features/news/presentation/pages/read_news_page.dart';
import 'package:skynet/features/main/features/news/presentation/widgets/news_card.dart';

class CommonNewsPage extends StatefulWidget {
  const CommonNewsPage({super.key});

  @override
  State<CommonNewsPage> createState() => _CommonNewsPageState();
}

class _CommonNewsPageState extends State<CommonNewsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final SharedPreferences prefs = SharedPreferencesRepository().prefs;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewListBloc>(context).add(GetNewListEvent());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<NewListBloc>(context).add(GetNewListEvent());
                },
                child: BlocBuilder<NewListBloc, NewListState>(
                  builder: (context, state) {
                    if (state is NewListLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is NewListSuccess) {
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: state.model.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {
                                setState(() {
                                  context
                                      .read<ViewedNewsProvider>()
                                      .addToViewedNewsList(
                                          data:
                                              state.model[index].id.toString());
                                });
                                BlocProvider.of<MarkAsViewedCubit>(context)
                                    .markAsViewed(
                                        postId:
                                            state.model[index].id.toString(),
                                        postType: state.model[index].postType);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ReadNewsPage(
                                              newsTitle:
                                                  state.model[index].title,
                                              text: state.model[index].text,
                                              image: state.model[index].image,
                                              postId: state.model[index].id
                                                  .toString(),
                                              postType:
                                                  state.model[index].postType,
                                            )));
                              },
                              child: CustomNewsCard(
                                isRead: prefs
                                        .getStringList("viewedNewsList")
                                        ?.contains(state.model[index].id.toString()) ??
                                    false,
                                title: state.model[index].title,
                                image: state.model[index].image,
                                news: state.model[index].text,
                                date: state.model[index].createdAt.toString(),
                              ),
                            );
                          });
                    } else if (state is NewListError) {
                      return Center(
                        child: CustomErrorWidget(
                          onTap: () {
                            setState(() {
                              BlocProvider.of<NewListBloc>(context)
                                  .add(GetNewListEvent());
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
