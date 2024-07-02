import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infozzle_task/configs/routes/route_name.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();

    navigate() ;
  }


  void navigate() async {
    await Future.delayed(const Duration(seconds: 2),() {
      context.goNamed(RouteName.bottomNavScreen);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Login Screen"),
      ),
    );
  }
  
}