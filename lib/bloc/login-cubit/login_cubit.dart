import 'package:bloc/bloc.dart';
import 'package:infozzle_task/configs/service/session/session_controller.dart';
import 'package:infozzle_task/repository/auth_http_api_repository.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  String? username, password;
  bool rememberMe = false;

  AuthHttpApiRepository authHttpApiRepository = AuthHttpApiRepository();

  void toggleRememberMe() {
    rememberMe = !rememberMe ;
    emit(LoginInitial());
  }

  void submitLoginForm() async{
    Map<String, String> data = {
      "username": username!,
      "password": password!
    };
    
    emit(LoginProcessingState());

    await authHttpApiRepository.loginApi(data).then((value) async {
      if(value["status"] == "error"){
        emit(LoginErrorState(message: value["message"]));
      }
      else{
        if(rememberMe){
          await SessionController().saveUserInPreference(value["token"]);
          await SessionController().getUserFromPreference();
        }
        emit(LoginSuccessState(message: "User Verified Succesfully !"));
      }
    }).onError((error, stackTrace){
      // emit(RegisteErrorState(message: error.toString()));
      emit(LoginErrorState(message: "Something went wrong !"));
    }); 
  }
}
