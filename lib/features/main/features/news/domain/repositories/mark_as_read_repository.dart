abstract class MarkAsViewedRepository {
  Future<void> markAsViewedRepository(
      {required String postId, required String postType});
}
