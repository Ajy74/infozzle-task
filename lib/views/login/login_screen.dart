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
        backgroundColor: AppColor.blackColor,
        body: Container(
        margin: EdgeInsets.only(left: size * 0.02, right: size * 0.02,top: MediaQuery.of(context).padding.top),
        color: AppColor.whiteColor,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListView(
              children: <Widget>[
              
                Container(
                width: size,
                margin: EdgeInsets.only(top: size*0.2),
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  style: TextStyle(
                  color: AppColor.blackColor.withOpacity(.8),
                  fontSize: size*0.07
                  ),
                ),
                ),

                SizedBox(height: size*0.06,),

                titleContainer("Username / Email", size),
                EmailInput(focusNode: _emailFocusNode),

                titleContainer("Password", size),
                PasswordInput(focusNode: _passwordFocusNode),

                const RememberMe(),

                SubmitButton(
                  formKey: _formKey,
                ), 
                
                SizedBox(height: size*0.09,),

                dontHaveAccountContainer(size),
              ],
            ),
          ),
        ),
      ));
  }

  titleContainer(String title, double size) {
    return Container(
      margin: EdgeInsets.only(bottom: size * 0.03,top: size*0.06),
      width: size,
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          color: AppColor.blackColor, 
          fontSize: size * 0.036,
          fontFamily: ""
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
  
  dontHaveAccountContainer(double size) {
    return Container(
      width: size,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(
              color: AppColor.blackColor, 
              fontSize: size * 0.036,
              fontFamily: "",
            ),
          ),

          SizedBox(width: size*0.01,),

          InkWell(
            onTap:(){
              context.pushReplacementNamed(RouteName.registerScreen);
            },
            child: Text(
              "Register here",
              style: TextStyle(
                color: AppColor.blackColor, 
                fontSize: size * 0.036,
                fontWeight: FontWeight.bold,
                fontFamily: ""
              ),
            ),
          )
        ],
      ),
    );
  }
}
