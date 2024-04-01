import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';
part 'pay_state.dart';

class PayCubit extends Cubit<PayState> {
  PayCubit() : super(PayInitial());
  Future <void> payFromService({required String url})async{
    emit(PayLoading());
    try{
      await launchUrl(Uri.parse(url));
      emit(PaySuccess());
    }catch(e){
      emit(PayError());
    }
  }
}
