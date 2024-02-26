import 'package:skynet/data/repositories/get_all_news_repo.dart';
import 'package:skynet/domain/usecase/get_all_news_repo_usecase.dart';

class GetAllNewsRepositoryImpl implements GetAllNewsRepository {
  GetAllNewsRepositoryUseCase useCase;
  GetAllNewsRepositoryImpl({required this.useCase});
  @override
  Future<List<dynamic>> getAllNewsMethod() async {
    return await useCase.getAllNews();
  }
}
