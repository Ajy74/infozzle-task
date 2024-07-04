//~ Abstract class defining methods for authentication API repositories.
abstract class AuthApiRepository {
  Future<dynamic> loginApi(dynamic data);
  Future<dynamic> registerApi(dynamic data);

  Future<dynamic> categoryApi();
  Future<dynamic> allPostsApi(int catid);
  Future<dynamic> singlePostsApi(int postid);

  Future<dynamic> supportApi(dynamic data);
}
