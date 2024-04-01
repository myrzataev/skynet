import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:skynet/features/main/features/home/data/repositories/get_trust_payment_impl.dart';

part 'get_trust_payment_event.dart';
part 'get_trust_payment_state.dart';

class GetTrustPaymentBloc
    extends Bloc<GetTrustPaymentEvent, GetTrustPaymentState> {
  GetTrustPaymentRepositoryImpl repositoryImpl;
  GetTrustPaymentBloc({required this.repositoryImpl})
      : super(GetTrustPaymentInitial()) {
    on<GetTrustPaymentEvent>((event, emit) async {
      emit(GetTrustPaymentLoading());
      try {
        await repositoryImpl.getTrustPayment();

        emit(GetTrustPaymentSuccess());
      } on DioException catch (e) {
        if (e.response != null) {
          print(e.response!.data);
          print(e.response!.headers);
          print(e.response!.requestOptions);
          emit(GetTrustPaymentError(errorText: e.toString()));
        }
      }
    });
  }
}
