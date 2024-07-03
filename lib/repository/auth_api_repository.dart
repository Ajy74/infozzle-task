//~ Abstract class defining methods for authentication API repositories.
abstract class AuthApiRepository {
  Future<dynamic> loginApi(dynamic data);
  Future<dynamic> registerApi(dynamic data);
  Future<dynamic> supportApi(dynamic data);
}
