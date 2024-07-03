import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infozzle_task/bloc/register-cubit/register_cubit.dart';
import 'package:infozzle_task/configs/color/color.dart';
import 'package:infozzle_task/configs/routes/route_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../register/widget/register_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameFocusNode = FocusNode();
  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  late RegisterCubit _registerCubit;

  @override
  void initState() {
    super.initState();

    _registerCubit = RegisterCubit() ;
  }

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    _registerCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: AppColor.blackColor,
        body: BlocProvider(
          create: (context) => _registerCubit,
          child: Container(
            margin: EdgeInsets.only(
                left: size * 0.02,
                right: size * 0.02,
                top: MediaQuery.of(context).padding.top),
            color: AppColor.whiteColor,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView(
                  children: <Widget>[
                    Container(
                      width: size,
                      margin: EdgeInsets.only(top: size * 0.2),
                      alignment: Alignment.center,
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: AppColor.blackColor.withOpacity(.8),
                            fontSize: size * 0.07),
                      ),
                    ),

                    SizedBox(
                      height: size * 0.06,
                    ),

                    titleContainer("Username", size),
                    UserNameInput(focusNode: _usernameFocusNode),

                    titleContainer("First Name", size),
                    FirstNameInput(focusNode: _firstNameFocusNode),

                    titleContainer("Last Name", size),
                    LastNameInput(focusNode: _lastNameFocusNode),

                    titleContainer("Email", size),
                    EmailInput(focusNode: _emailFocusNode),

                    titleContainer("Password", size),
                    PasswordInput(focusNode: _passwordFocusNode),

                    titleContainer("Confirm Password", size),
                    ConfirmPasswordInput(focusNode: _confirmPasswordFocusNode),

                    SizedBox(
                      height: size * 0.09,
                    ),

                    SubmitButton(
                      formKey: _formKey,
                    ),

                    SizedBox(
                      height: size * 0.09,
                    ),
                    alreadyHaveAccountContainer(size),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  titleContainer(String title, double size) {
    return Container(
      margin: EdgeInsets.only(bottom: size * 0.03, top: size * 0.06),
      width: size,
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
            color: AppColor.blackColor, fontSize: size * 0.036, fontFamily: ""),
        textAlign: TextAlign.left,
      ),
    );
  }

  alreadyHaveAccountContainer(double size) {
    return SizedBox(
      width: size,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account?",
            style: TextStyle(
              color: AppColor.blackColor,
              fontSize: size * 0.036,
              fontFamily: "",
            ),
          ),
          SizedBox(
            width: size * 0.01,
          ),
          InkWell(
            onTap: () {
              context.pushReplacementNamed(RouteName.loginScreen);
            },
            child: Text(
              "Login here",
              style: TextStyle(
                  color: AppColor.blackColor,
                  fontSize: size * 0.036,
                  fontWeight: FontWeight.bold,
                  fontFamily: ""),
            ),
          )
        ],
      ),
    );
  }
}
