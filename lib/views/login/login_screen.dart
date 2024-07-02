import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infozzle_task/configs/color/color.dart';
import 'package:infozzle_task/configs/routes/route_name.dart';
import 'package:infozzle_task/views/login/widget/login_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    // navigate() ;
  }

  void navigate() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        context.pushReplacementNamed(RouteName.bottomNavScreen);
      },
    );
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(left: size * 0.02, right: size * 0.02),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              titleContainer("Username / Email", size),
              EmailInput(focusNode: _emailFocusNode),
              // PasswordInput(focusNode: _passwordFocusNode),
              // SubmitButton(
              //   formKey: _formKey,
              // ), // Widget for submit button
            ],
          ),
        ),
      ),
    ));
  }

  titleContainer(String title, double size) {
    return Container(
      margin: EdgeInsets.only(bottom: size * 0.03),
      width: size,
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          color: AppColor.blackColor, 
          fontSize: size * 0.036,
          fontWeight: FontWeight.bold,
          fontFamily: ""
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
