import 'package:bloc/bloc.dart';
import 'package:infozzle_task/repository/auth_http_api_repository.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  String? username, firstName, lastName, email, password, confirmPassword;
  AuthHttpApiRepository authHttpApiRepository = AuthHttpApiRepository();

  
  void submitRegisterForm() async{
    Map<String, String> data = {
      "username": username!,
      "email": email!,
      "password": password!,
      "first_name": firstName!,
      "last_name": lastName!
    };
    

    emit(RegisterProcessingState());

    await authHttpApiRepository.registerApi(data).then((value) async {

      if(value["status"] == "error"){
        emit(RegisteErrorState(message: value["message"]));
      }
      else{
        emit(RegisteSuccessState(message: "User Registered Succesfully !", userid: value.userid));
      }
    }).onError((error, stackTrace){
      // emit(RegisteErrorState(message: error.toString()));
      emit(RegisteErrorState(message: "Something went wrong !"));
    });
  }
  
}
