import 'package:skynet/features/authorization/data/models/authorization_get_sms_model.dart';
import 'package:skynet/features/authorization/domain/repositories/authorization_get_sms_repo.dart';
import 'package:skynet/features/authorization/data/data_sources/authorization_get_sms_usecase.dart';

class AuthorizationGetSmsCodeRepositoryImpl
    implements AuthorizationGetSmsCodeRepository {
  AuthorizationGetSmsCodeUseCase useCase;
  AuthorizationGetSmsCodeRepositoryImpl({required this.useCase});
  @override
  Future<AuthorizationModel> authorizeGetSmsCode({required String lsAbonent, required String phoneNumber}) async {
    return await useCase.authorizeGetSmsCode(lsAbonent: lsAbonent, phoneNumber: phoneNumber);
  }
}
