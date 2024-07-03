import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infozzle_task/bloc/support-cubit/support_cubit.dart';
import 'package:infozzle_task/configs/color/color.dart';
import 'package:infozzle_task/views/support/widget/support_widget.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final _usernameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _subjectFocusNode = FocusNode();
  final _messageFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  late SupportCubit _supportCubit;

  @override
  void initState() {
    super.initState();

    _supportCubit = SupportCubit() ;
  }

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _emailFocusNode.dispose();
    _subjectFocusNode.dispose();
    _messageFocusNode.dispose();
    _supportCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: BlocProvider(
          create: (context) => _supportCubit,
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
                        "Contact Us",
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

                    titleContainer("Email Id", size),
                    EmailInput(focusNode: _emailFocusNode),

                    titleContainer("Subject", size),
                    SubjectInput(focusNode: _subjectFocusNode),

                    titleContainer("Message", size),
                    MessageInput(focusNode: _messageFocusNode),


                    SizedBox(
                      height: size * 0.09,
                    ),

                    SubmitButton(
                      formKey: _formKey,
                    ),

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
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: TextStyle(
                color: AppColor.blackColor,
                fontSize: size * 0.036,
                fontFamily: "",
              ),
            ),
            TextSpan(
              text: title == "Message" ? "" :" *",
              style: TextStyle(
                color: Colors.red,
                fontSize: size * 0.036,
                fontFamily: "",
              ),
            ),
          ],
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

}