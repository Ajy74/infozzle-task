import 'package:infozzle_task/configs/models/all_post_model.dart';
import 'package:infozzle_task/configs/models/category_model.dart';
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
    return response;
  }

  @override
  Future<dynamic> registerApi(dynamic data) async {
    dynamic response = await _apiServices.postApi(AppUrl.registerEndPint, data);
    return response;  
  }

  @override
  Future<dynamic> categoryApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.categoryEndPint);
    final List<CategoryModel> items = (response as List).map((item) => CategoryModel.fromJson(item)).toList();
    return items;  
  }


  @override
  Future<dynamic> allPostsApi(int catid) async {
    dynamic response = await _apiServices.getApi("${AppUrl.postEndPint}/?category_id=$catid");
    final List<AllPostModel> posts = (response as List).map((item) => AllPostModel.fromJson(item)).toList();
    return posts;  
  }

  @override
  Future<dynamic> supportApi(dynamic data) async {
    dynamic response = await _apiServices.postApi(AppUrl.contactEndPint, data);
    // return UserModel.fromJson(response);
    return response;  
  }
}
