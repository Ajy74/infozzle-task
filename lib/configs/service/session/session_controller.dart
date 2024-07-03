
import 'package:flutter/material.dart'; 
import '../storage/local_storage.dart'; 

//~ A singleton class for managing user session data.
class SessionController {

  final LocalStorage sharedPreferenceClass = LocalStorage();

  //~ Singleton instance of [SessionController].
  static final SessionController _session = SessionController._internal();

  static bool? isLogin;
  // static UserModel user = UserModel();

  //~ Private constructor for creating the singleton instance of [SessionController].
  SessionController._internal() {
    isLogin = false;
  }

  //In Dart, a factory constructor is a special kind of constructor that can return an instance of the class,
  // potentially a cached or pre-existing instance, instead of always creating a new one.
  // It's defined using the factory keyword.
  // This is useful for implementing patterns like singletons or when you want to control instance creat
  
  //~ Factory constructor for accessing the singleton instance of [SessionController].
  factory SessionController() {
    return _session;
  }


  Future<void> saveUserInPreference(dynamic token) async {
    sharedPreferenceClass.setValue('token', token);
    sharedPreferenceClass.setValue('isLogin', 'true');
  }


  // Retrieves user data from the local storage and assigns it to the session controller  to be used across the app.
  Future<void> getUserFromPreference() async {
    try {
      var savedToken = await sharedPreferenceClass.readValue('token');
      var isLogin = await sharedPreferenceClass.readValue('isLogin');

      if (savedToken.isNotEmpty) {
        // SessionController.user = UserModel.fromJson(jsonDecode(userData));
      }
      SessionController.isLogin = isLogin == 'true' ? true : false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
