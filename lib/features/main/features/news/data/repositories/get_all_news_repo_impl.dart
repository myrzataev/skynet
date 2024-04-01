import 'package:skynet/features/main/features/news/data/models/news_model.dart';
import 'package:skynet/features/main/features/news/domain/repositories/get_all_news_repo.dart';
import 'package:skynet/features/main/features/news/data/usecase/get_all_news_repo_usecase.dart';

class GetAllNewsRepositoryImpl implements GetAllNewsRepository {
  GetAllNewsRepositoryUseCase useCase;
  GetAllNewsRepositoryImpl({required this.useCase});
  @override
  Future<List<NewsModel>> getAllNewsMethod() async {
    return await useCase.getAllNews();
  }


}
