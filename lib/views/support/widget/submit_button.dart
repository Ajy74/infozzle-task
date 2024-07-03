import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infozzle_task/bloc/support-cubit/support_cubit.dart';
import 'package:infozzle_task/configs/color/color.dart';
import 'package:infozzle_task/configs/components/custom_button.dart';
import 'package:infozzle_task/utils/custom_snackbar.dart';

class SubmitButton extends StatelessWidget {
  final formKey;
  const SubmitButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    // final double size = MediaQuery.of(context).size.width;

    return BlocConsumer<SupportCubit, SupportState>(
      listener: (context, state) {
        if(state is SupportErrorState){
          customSnackBar(context, state.message, AppColor.redColor);
        }
        if(state is SupportSuccessState){
          customSnackBar(context, state.message, Colors.green);
        }
      },
      builder: (context, state) {
        return CustomButton(
            title: "Submit",
            buttonColor: AppColor.blackColor,
            textColor: AppColor.whiteColor,
            radius: 0,
            loading: state is SupportProcessingState,
            onPress: () {
              if (formKey.currentState.validate()) {
                context.read<SupportCubit>().submitContactForm();
              }
            });
      },
    );
  }
}
