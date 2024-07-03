import 'package:infozzle_task/utils/app_url.dart';

import '../../data/network/base_api_services.dart';
import '../../data/network/network_api_services.dart';
import 'auth_api_repository.dart';

//~ Implementation of [AuthApiRepository] for making HTTP requests to the authentication API.
class AuthHttpApiRepository implements AuthApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<dynamic> loginApi(dynamic data) async {
    dynamic response = await _apiServices.postApi(AppUrl.loginEndPint, data);
    // return UserModel.fromJson(response);
    return response;
  }

  @override
  Future<dynamic> registerApi(dynamic data) async {
    dynamic response = await _apiServices.postApi(AppUrl.registerEndPint, data);
    // return UserModel.fromJson(response);
    return response;  
  }
}
