import 'package:bloc/bloc.dart';
import 'package:infozzle_task/repository/auth_http_api_repository.dart';
import 'package:meta/meta.dart';

part 'support_state.dart';

class SupportCubit extends Cubit<SupportState> {
  SupportCubit() : super(SupportInitial());

  String? username, email, subject, message;
  AuthHttpApiRepository authHttpApiRepository = AuthHttpApiRepository();

  void submitContactForm() async{
    Map<String, String> data = {
      "input_1": username!,
      "input_3": email!,
      "input_4": subject!,
      "input_5": message ?? "",
    };
    
    emit(SupportProcessingState());

    await authHttpApiRepository.supportApi(data).then((value) async {
      if(!value["is_valid"]){
        emit(SupportErrorState(message: "Something went wrong !"));
      }
      else{
          email = "";
          username = "";
          subject = "";
          message = "";
        emit(SupportSuccessState(message: "Submitted Succesfully !"));
      }
    }).onError((error, stackTrace){
      // print(error.toString());
      // emit(SupportErrorState(message: error.toString()));
      emit(SupportErrorState(message: "Something went wrong !"));
    }); 
  }
}
