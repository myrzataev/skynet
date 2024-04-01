import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:skynet/features/authorization/data/usecase/confirm_code_repository.dart';

part 'confirm_code_event.dart';
part 'confirm_code_state.dart';

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvent, ConfirmCodeState> {
  ConfirmCodeRepository repository;
  ConfirmCodeBloc({required this.repository}) : super(ConfirmCodeInitial()) {
    on<ConfirmsmsCodeEvent>((event, emit) async {
      emit(ConfirmCodeLoading());
      try {
        await repository.confirmCode(code: event.smsCode);
        emit(ConfirmCodeSucccess());
      } on DioException catch (e) {
        if (e.type == DioExceptionType.sendTimeout) {
          emit(ConfirmCodeError(errorText: "Проверьте интернет подключение"));
        } else if (e.type == DioExceptionType.badResponse) {
          emit(ConfirmCodeError(errorText: "Неправильный код"));
        } else if (e.type == DioExceptionType.connectionError) {
          emit(ConfirmCodeError(errorText: "Проверьте интернет подключение"));
        } else if (e.type == DioExceptionType.receiveTimeout) {
          emit(ConfirmCodeError(errorText: "Проверьте интернет подключение"));
        }
      } catch (error) {
        emit(ConfirmCodeError(
            errorText: "Что то пошло не так, попробуйте снова"));
      }
    });
  }
}
