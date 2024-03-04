import 'package:skynet/modules/home/data/repositories/get_all_news_repo.dart';
import 'package:skynet/modules/home/domain/usecase/get_all_news_repo_usecase.dart';

class GetAllNewsRepositoryImpl implements GetAllNewsRepository {
  GetAllNewsRepositoryUseCase useCase;
  GetAllNewsRepositoryImpl({required this.useCase});
  @override
  Future<List<dynamic>> getAllNewsMethod() async {
    return await useCase.getAllNews();
  }
}
