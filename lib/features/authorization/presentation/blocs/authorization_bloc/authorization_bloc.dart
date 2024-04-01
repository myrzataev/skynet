import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:skynet/features/authorization/data/models/authorization_get_sms_model.dart';
import 'package:skynet/features/authorization/data/repositories/authorization_get_sms_impl.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationGetSmsCodeRepositoryImpl repository;
  AuthorizationBloc({required this.repository})
      : super(AuthorizationInitial()) {
    on<AuthorizationGetSmsEvent>((event, emit) async {
      emit(AuthorizationLoading());

      try {
        final result = await repository.authorizeGetSmsCode(
            lsAbonent: event.lsAbonent, phoneNumber: event.phoneNumber);
        emit(AuthorizationSuccess(model: result));
      } on DioException catch (e) {
        if (e.type == DioExceptionType.sendTimeout) {
          emit(AuthorizationError(errorText: "Проверьте интернет подключение"));
        } else if (e.type == DioExceptionType.badResponse) {
          emit(AuthorizationError(errorText: "Лицевой счет не найден"));
        } else if (e.type == DioExceptionType.connectionError) {
          emit(AuthorizationError(errorText: "Проверьте интернет подключение"));
        } else if (e.type == DioExceptionType.receiveTimeout) {
          emit(AuthorizationError(errorText: "Проверьте интернет подключение"));
        }
      } catch (e) {
        emit(AuthorizationError(
            errorText: "Что то пошло не так, попробуйте снова"));
      }
    });
  }
}
