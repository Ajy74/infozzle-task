import 'package:flutter/material.dart';
import 'package:infozzle_task/configs/color/color.dart';
import 'package:infozzle_task/configs/components/custom_button.dart';

class SubmitButton extends StatelessWidget {
  final formKey;
  const SubmitButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;

    return CustomButton(
        title: "Log In",
        buttonColor: AppColor.blackColor,
        textColor: AppColor.whiteColor,
        radius: 0,
        loading: false,
        onPress: () {
          if (formKey.currentState.validate()) {
            // context.read<LoginBloc>().add(LoginApi());
          }
        }
    );
  }
}
