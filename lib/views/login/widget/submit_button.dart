import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infozzle_task/bloc/login-cubit/login_cubit.dart';
import 'package:infozzle_task/configs/color/color.dart';
import 'package:infozzle_task/configs/components/custom_button.dart';
import 'package:infozzle_task/configs/routes/route_name.dart';
import 'package:infozzle_task/utils/custom_snackbar.dart';

class SubmitButton extends StatelessWidget {
  final dynamic formKey;
  const SubmitButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    // final double size = MediaQuery.of(context).size.width;

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginErrorState){
          customSnackBar(context, state.message, AppColor.redColor);
        }
        if(state is LoginSuccessState){
          customSnackBar(context, state.message, Colors.green);
          context.pushReplacementNamed(RouteName.bottomNavScreen);
        }
      },
      builder: (context, state) {
        return CustomButton(
            title: "Log In",
            buttonColor: AppColor.blackColor,
            textColor: AppColor.whiteColor,
            radius: 0,
            loading: state is LoginProcessingState,
            onPress: () {
              if (formKey.currentState.validate()) {
                context.read<LoginCubit>().submitLoginForm();
              }
            });
      },
    );
  }
}
