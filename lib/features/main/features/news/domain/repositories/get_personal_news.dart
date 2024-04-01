import 'package:skynet/features/main/features/news/data/models/personal_news_model.dart';

abstract class GetPersonalNewsRepository {
  Future<List<PersonalNewsModel>> getPersonalNews();
}
