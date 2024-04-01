import 'package:skynet/features/main/features/profile/domain/repositories/logout_repository.dart';
import 'package:skynet/features/main/features/profile/data/usecase/logout_use_case.dart';

class LogOutRepositoryImpl implements LogOutRepository{
  LogOutUseCase useCase;
  LogOutRepositoryImpl({required this.useCase});
  @override
  Future<void> logOut() async{
   
   await useCase.logOut();
  }
  
}