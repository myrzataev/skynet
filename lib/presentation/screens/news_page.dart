import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skynet/data/providers/profile_info_provider.dart';
import 'package:skynet/presentation/blocs/news_bloc/new_list_bloc.dart';
import 'package:skynet/presentation/screens/read_news_page.dart';
import 'package:skynet/presentation/widgets/custom_appbar.dart';
import 'package:skynet/presentation/widgets/news_card.dart';
import 'package:skynet/resources/resources.dart';

@RoutePage()
class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewListBloc>(context).add(GetNewListEvent());
    List<Map<String, String>> newsCategories = [
      {"name": "Новости", "image": Images.activenews},
      {"name": "Смс рассылки", "image": Images.sms},
      {"name": "Акции", "image": Images.announcement},
    ];
    return Scaffold(
      body: Column(children: [
        CustomAppBar(
          nameSurName:
              context.watch<GetProfileInfoProvider>().model?.name ?? "",
          address: context
                  .watch<GetProfileInfoProvider>()
                  .model
                  ?.address
                  .toString() ??
              "",
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: SizedBox(
                  height: 40,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: newsCategories.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ChoiceChip(
                              showCheckmark: false,
                              side: const BorderSide(
                                  width: 0, color: Colors.white),
                              avatar: ImageIcon(
                                AssetImage(newsCategories[index]["image"]!),
                                color: const Color(0xffEC0478),
                              ),
                              label: Text(newsCategories[index]["name"]!,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "Gotham")),
                              selected: _value == index,
                              selectedColor: Colors.grey,
                              onSelected: (selectedcategory) {
                                setState(() {
                                  _value = selectedcategory ? index : 0;
                                });
                              }),
                        );
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.67,
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
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ReadNewsPage(
                                                title: state.model[index]
                                                    ["title"],
                                                text: state.model[index]
                                                    ["text"],
                                              )));
                                },
                                child: CustomNewsCard(
                                    title: state.model[index]["title"],
                                    image: state.model[index]["image"],
                                    news: state.model[index]["text"]),
                              );
                            });
                      } else if (state is NewListError) {
                        return Center(child: Text(state.errorText));
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
