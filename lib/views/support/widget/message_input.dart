import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infozzle_task/bloc/support-cubit/support_cubit.dart';
import 'package:infozzle_task/configs/color/color.dart';

class MessageInput extends StatelessWidget {
  final FocusNode focusNode;
  const MessageInput({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupportCubit, SupportState>(
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
          keyboardType: TextInputType.multiline,
          minLines: 3,
          maxLines: 10,
          onChanged: (value) {
            context.read<SupportCubit>().message = value.isEmpty ? "" : value ;
          },
          validator: (value) {
            // if (value!.isEmpty) {
            //   return 'Enter Username';
            // }
            return null;
          },
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}
