import 'package:skynet/features/main/features/home/domain/entity/application_status_entity.dart';

abstract class ApplicationStatusRepo {
  Future<ApplicationStatusEntity> applicationStatus();
}
