import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infozzle_task/bloc/login-cubit/login_cubit.dart';
import 'package:infozzle_task/configs/color/color.dart';

class RememberMe extends StatelessWidget {
  const RememberMe({super.key});

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: size * 0.04),
      child: Row(
        children: [
          Transform.scale(
            scale: 1.1,
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: const VisualDensity(horizontal: -4),
                  value: context.read<LoginCubit>().rememberMe,
                  onChanged: (value) {
                    context.read<LoginCubit>().toggleRememberMe() ;
                  },
                  activeColor: AppColor.checkboxColor,
                  checkColor: AppColor.whiteColor,
                );
              },
            ),
          ),
          SizedBox(
            width: size * 0.02,
          ),
          Text(
            "Remember me",
            style: TextStyle(
                color: AppColor.blackColor,
                fontSize: size * 0.036,
                fontFamily: ""),
          )
        ],
      ),
    );
  }
}
