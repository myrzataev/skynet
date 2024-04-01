import 'package:skynet/features/main/features/news/data/models/local_news_model.dart';
import 'package:skynet/features/main/features/news/domain/repositories/get_local_news.dart';
import 'package:skynet/features/main/features/news/data/usecase/get_local_news_usecase.dart';

class GetLocalNewsRepositoryImpl implements GetLocalNewsRepository {
  GetLocalNewsUseCase useCase;
  GetLocalNewsRepositoryImpl({required this.useCase});
  @override
  Future<Iterable<LocalNewsModel>> getLocalNews() async {
    return await useCase.getLocalNews();
  }
}
