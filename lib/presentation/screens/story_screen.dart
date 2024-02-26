import 'package:flutter/material.dart';
import 'package:skynet/data/dummydata/storydata.dart';
import 'package:story_view/story_view.dart';

// ignore: must_be_immutable
class MyStoryPage extends StatefulWidget {
  List<StoryModel> listStoryModel;
  final int currentUserId;

  MyStoryPage(
      {Key? key, required this.currentUserId, required this.listStoryModel})
      : super(key: key);

  @override
  _MyStoryPageState createState() => _MyStoryPageState();
}

class _MyStoryPageState extends State<MyStoryPage> {
  // final List<StoryModel> usersStories = widget.listStoryModel;
  late List<String> currentStoryUrls;
  late StoryController storyController;
  late int currentUserIndex = currentUserIndex;

  @override
  void initState() {
    super.initState();
    currentUserIndex = widget.currentUserId;
    storyController = StoryController();
    loadUserStories(widget.listStoryModel[widget.currentUserId]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    storyController.dispose();
  }

  void loadUserStories(StoryModel model) {
    currentStoryUrls = model.photoOrUrl;
    print(currentStoryUrls.runtimeType);
    print(currentStoryUrls);

    print("loading storis");
  }

  void navigateToNextUserStories() {
    if (currentUserIndex + 1 < widget.listStoryModel.length) {
      currentUserIndex++;
      setState(() {
        loadUserStories(widget.listStoryModel[currentUserIndex]);
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: StoryView(
        inline: true,
        controller: storyController,
        storyItems: currentStoryUrls.map((url) {
          return StoryItem.pageProviderImage(AssetImage(url),
              duration: const Duration(seconds: 5));
        }).toList(),
        onComplete: () {
          print('All stories have been viewed');

          Navigator.pop(context);
          // navigateToNextUserStories();
        },
        onVerticalSwipeComplete: (direction) {
          if (direction == Direction.down) {
            Navigator.pop(context);
          }
          print("build comleted");
        },
      ),
    );
  }
}
