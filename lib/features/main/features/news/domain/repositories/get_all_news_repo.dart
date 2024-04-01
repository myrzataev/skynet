
import 'package:skynet/features/main/features/news/data/models/news_model.dart';

abstract class GetAllNewsRepository{
  Future<List<NewsModel>> getAllNewsMethod();
}