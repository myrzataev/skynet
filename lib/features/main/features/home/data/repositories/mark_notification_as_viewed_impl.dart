import 'package:skynet/features/main/features/home/data/data_sources/mark_notification_as_viewed_ds.dart';
import 'package:skynet/features/main/features/home/domain/repositories/mark_notification_as_viewed_repo.dart';

class MarkNotificationAsViewedImpl implements MarkNotificationAsViewedRepo {
  MarkNotificationAsViewedDs dataSource;
  MarkNotificationAsViewedImpl({required this.dataSource});
  @override
  Future<void> markAsViewed({required int id}) async {
    await dataSource.markAsViewed(id: id);
  }
}
