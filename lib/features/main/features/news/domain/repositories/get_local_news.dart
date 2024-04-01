import 'package:skynet/features/main/features/news/data/models/local_news_model.dart';

abstract class GetLocalNewsRepository{
  Future<Iterable<LocalNewsModel>> getLocalNews();
}