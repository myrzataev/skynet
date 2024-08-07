import 'package:skynet/features/main/features/home/data/data_sources/get_notifications_list_ds.dart';
import 'package:skynet/features/main/features/home/data/models/notifications_model.dart';
import 'package:skynet/features/main/features/home/domain/repositories/get_notifications_list.dart';

class GetNotificationsListImpl implements GetNotificationsList {
  GetNotificationsListDs dataSource;
  GetNotificationsListImpl({required this.dataSource});
  @override
  Future<List<NotificationsModel>> getNotificationsList() async {
    return await dataSource.getNotificationsList();
  }
}
