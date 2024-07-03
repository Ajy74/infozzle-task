import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:infozzle_task/data/exception/app_exception.dart';
import 'package:infozzle_task/data/network/base_api_services.dart';


//~ Class for handling network API requests.
class NetworkApiService implements BaseApiServices {

  //~ Sends a GET request to the specified [url] and returns the response.
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection !');
    } on TimeoutException {
      throw FetchDataException('Network Request time out !');
    }

    // if (kDebugMode) {
    //   print(responseJson);
    // }
    return responseJson;
  }

  //~ Sends a POST request to the specified [url] with the provided [data]
  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    dynamic responseJson;
    
    try {
      final Response response = await post(
        Uri.parse(url), 
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      ).timeout(const Duration(seconds: 10));
      
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection !');
    } on TimeoutException {
      throw FetchDataException('Network Request time out !');
    }

    // if (kDebugMode) {
    //   print(responseJson);
    // }
    return responseJson;
  }

  //~ Parses the [response] and returns the corresponding JSON data.
  dynamic returnResponse(http.Response response) {
    // if (kDebugMode) {
    //   print(response.statusCode);
    // }

    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        throw BadRequestException(response.body.toString());
      case 500:
        throw InternalServerException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException('Error occured while communicating with server');
    }
  }
}
