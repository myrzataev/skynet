import 'package:skynet/features/authorization/data/models/authorization_get_sms_model.dart';

abstract class AuthorizationGetSmsCodeRepository {
  Future<AuthorizationModel> authorizeGetSmsCode({required String lsAbonent, required String phoneNumber});
}
