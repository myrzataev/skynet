import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skynet/features/main/features/news/data/repositories/mark_as_read_impl.dart';

part 'mark_as_viewed_state.dart';

class MarkAsViewedCubit extends Cubit<MarkAsViewedState> {
  MarkAsViewedRepositoryImpl repositoryImpl;
  MarkAsViewedCubit({required this.repositoryImpl})
      : super(MarkAsViewedInitial());
  Future<void> markAsViewed(
      {required String postId, required String postType}) async {
    emit(MarkAsViewedLoading());
    try {
      await repositoryImpl.markAsViewedRepository(
          postId: postId, postType: postType);
      emit(MarkAsViewedSuccess());
    } catch (_) {
      emit(MarkAsViewedError());
    }
  }
}
