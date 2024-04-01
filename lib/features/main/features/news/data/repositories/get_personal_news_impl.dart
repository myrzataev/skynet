import 'package:skynet/features/main/features/news/data/models/personal_news_model.dart';
import 'package:skynet/features/main/features/news/domain/repositories/get_personal_news.dart';
import 'package:skynet/features/main/features/news/data/usecase/get_personal_news_use_case.dart';

class GetPersonalNewsImpl implements GetPersonalNewsRepository{
  GetPersonalNewsImpl({required this.useCase});
  @override
  Future<List<PersonalNewsModel>> getPersonalNews()async {
    return useCase.getPersonalNews();
  }
  GetPersonalNewsRepositoryUseCase useCase;
  
}