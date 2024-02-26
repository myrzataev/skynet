
import 'package:skynet/resources/resources.dart';

class StoryModel {
  final List<String> photoOrUrl;
  final int id;
  
  StoryModel({required this.photoOrUrl, required this.id});
}

abstract class StoryModelData {
  static List<StoryModel> stories = [
    StoryModel(photoOrUrl: [
      Images.listviewphoto
    ], id: 0),
    StoryModel(photoOrUrl: [
      Images.story
    ], id: 1),
    StoryModel(photoOrUrl: [
      Images.listviewphoto
      
    ], id: 2),
  ];
}
