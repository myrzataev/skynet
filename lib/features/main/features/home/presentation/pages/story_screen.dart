import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story/story_page_view.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen(
      {super.key, required this.userList, required this.storyIndex});
  final List<UserModel> userList;
  final int storyIndex;

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  @override
  void initState() {
    super.initState();

    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: StoryPageView(
        indicatorDuration: const Duration(seconds: 10),
        initialPage: widget.storyIndex,
        indicatorPadding: EdgeInsets.only(top: 45.h),
        itemBuilder: (context, pageIndex, storyIndex) {
          final user = widget.userList[pageIndex];
          final story = user.stories[storyIndex];
          return Stack(
            children: [
              Positioned.fill(
                child: Container(color: Colors.black),
              ),
              Positioned.fill(
                  child: Image(
                image: NetworkImage(
                  story.imageUrl,
                ),
                fit: BoxFit.contain,
              )),
            ],
          );
        },
        gestureItemBuilder: (context, pageIndex, storyIndex) {
          return Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: IconButton(
                padding: EdgeInsets.zero,
                color: Colors.white,
                icon: Icon(
                  Icons.close,
                  size: 30.h,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
        pageLength: widget.userList.length,
        storyLength: (int pageIndex) {
          return widget.userList[pageIndex].stories.length;
        },
        onPageLimitReached: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class UserModel {
  UserModel({required this.stories});
  final List<StoryModelTest> stories;
  // final String imageUrl;
}

class StoryModelTest {
  StoryModelTest(this.imageUrl);

  final String imageUrl;
}
