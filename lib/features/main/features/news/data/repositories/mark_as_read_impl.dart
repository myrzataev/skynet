import 'package:skynet/features/main/features/news/domain/repositories/mark_as_read_repository.dart';
import 'package:skynet/features/main/features/news/data/usecase/mark_as_viewed_use_case.dart';

class MarkAsViewedRepositoryImpl implements MarkAsViewedRepository{
  MarkAsViewedUseCase useCase;
  MarkAsViewedRepositoryImpl({required this.useCase});
  @override
  Future<void> markAsViewedRepository({required String postId, required String postType}) async{
    await useCase.markAsViewed(postId: postId, postType: postType);
  }

}