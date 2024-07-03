import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infozzle_task/bloc/register-cubit/register_cubit.dart';
import 'package:infozzle_task/configs/color/color.dart';
import 'package:infozzle_task/configs/components/custom_button.dart';
import 'package:infozzle_task/utils/custom_snackbar.dart';

class SubmitButton extends StatelessWidget {
  final dynamic formKey;
  const SubmitButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    // final double size = MediaQuery.of(context).size.width;

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if(state is RegisteErrorState){
          customSnackBar(context, state.message, AppColor.redColor);
        }
        if(state is RegisteSuccessState){

        }
      },
      builder: (context, state) {
        return CustomButton(
        title: "Register",
        buttonColor: AppColor.blackColor,
        textColor: AppColor.whiteColor,
        radius: 0,
        loading: state is RegisterProcessingState,
        onPress: () {
          if (formKey.currentState.validate()) {
            context.read<RegisterCubit>().submitRegisterForm();
          }
        });
      },
    );
  }
}
