import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infozzle_task/configs/routes/route_name.dart';
import 'package:infozzle_task/configs/service/session/session_controller.dart'; 


class AuthServices {

  void checkAuthentication(BuildContext context) async {

    SessionController().getUserFromPreference().then((value) async {
  
      if (SessionController.isLogin ?? false) {
        Timer(
          const Duration(seconds: 0),
          () => context.pushReplacementNamed(RouteName.homeScreen),
        );
      } else {
        // Timer(
        //   const Duration(seconds: 0),
        //   () => context.pushReplacementNamed(RouteName.loginScreen),
        // );
      }
    }).onError((error, stackTrace) {
      // Timer(
      //   const Duration(seconds: 0),
      //   () => context.pushReplacementNamed(RouteName.loginScreen),
      // );
    });
  }
}
