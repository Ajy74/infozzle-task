import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infozzle_task/bloc/register-cubit/register_cubit.dart';
import 'package:infozzle_task/configs/color/color.dart';
import 'package:infozzle_task/utils/validation_exception.dart';

class EmailInput extends StatelessWidget {
  final FocusNode focusNode;
  const EmailInput({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          focusNode: focusNode,
          cursorColor: AppColor.blackColor,
          cursorWidth: 1,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.blackColor),
              borderRadius: BorderRadius.all(Radius.zero),
            ),
            contentPadding: EdgeInsets.fromLTRB(12, 6, 12, 6),
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            context.read<RegisterCubit>().email = value ;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter email';
            }
            if (!value.emailValidator()) {
              return 'Email is not correct';
            }
            return null;
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
