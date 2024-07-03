import 'package:flutter/material.dart';
import 'package:infozzle_task/configs/color/color.dart';

class PasswordInput extends StatelessWidget {
  final FocusNode focusNode;
  const PasswordInput({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context) {
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
      keyboardType:TextInputType.text, 
      onChanged: (value) {
        // context.read<LoginBloc>().add(EmailChanged(email: value));
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter Username';
        }
        // if (value.emailValidator()) {
        //   return 'Email is not correct';
        // }
        return null;
      },
      textInputAction: TextInputAction.next,
    );
  }
}
