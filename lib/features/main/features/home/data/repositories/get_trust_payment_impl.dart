import 'package:skynet/features/main/features/home/domain/repositories/get_trust_payment.dart';
import 'package:skynet/features/main/features/home/data/data_sources/get_trust_payment_usecase.dart';

class GetTrustPaymentRepositoryImpl implements GetTrustPaymentRepository {
  GetTrustPaymentUseCase useCase;
  GetTrustPaymentRepositoryImpl({required this.useCase});
  @override
  Future<void> getTrustPayment() async {
    await useCase.getTrustPayment();
  }
}
