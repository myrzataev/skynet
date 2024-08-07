import 'package:skynet/features/main/features/home/data/models/notifications_model.dart';

abstract interface class GetNotificationsList {
  Future<List<NotificationsModel>> getNotificationsList();
}
