//~ Abstract class for defining base API services.
abstract class BaseApiServices {

  //~ Fetches data from the API using a GET request.
  Future<dynamic> getApi(String url);

  //~ Sends data to the API using a POST request.
  Future<dynamic> postApi(String url, dynamic data);
}
