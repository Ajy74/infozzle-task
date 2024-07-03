import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infozzle_task/bloc/register-cubit/register_cubit.dart';
import 'package:infozzle_task/configs/color/color.dart';

class LastNameInput extends StatelessWidget {
  final FocusNode focusNode;
  const LastNameInput({super.key, required this.focusNode});

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
          keyboardType: TextInputType.text,
          onChanged: (value) {
            context.read<RegisterCubit>().lastName = value ;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter last name';
            }
            return null;
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
