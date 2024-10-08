import 'package:skynet/features/main/features/home/data/data_sources/application_status_use_case.dart';
import 'package:skynet/features/main/features/home/domain/entity/application_status_entity.dart';
import 'package:skynet/features/main/features/home/domain/repositories/application_status_repo.dart';

class ApplicationStatusRepoImpl implements ApplicationStatusRepo {
  ApplicationStatusUseCase useCase;
  ApplicationStatusRepoImpl({required this.useCase});
  @override
  Future<List<ApplicationStatusEntity>> applicationStatus() async {
    return await useCase.getApplicationStatus();
  }
}
