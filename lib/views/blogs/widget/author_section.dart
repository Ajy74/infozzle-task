import 'package:flutter/material.dart';
import 'package:infozzle_task/configs/color/color.dart';

class AuthorSection extends StatelessWidget {
  const AuthorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;

    return Container(
      height: size*0.17,
      width: size,
      margin: EdgeInsets.symmetric(horizontal: size*0.03),
      child: Column(
        children: [
          Container(
            height: 1,
            color: AppColor.blackColor.withOpacity(.1),
          ),

          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  radius: size * 0.06,
                  child: ClipOval(
                      child: Image.asset(
                    "assets/images/user.png",
                    fit: BoxFit.cover,
                    height: size * 0.12,
                    width: size * 0.12,
                  )),
                ),
                SizedBox(
                  width: size * 0.03,
                ),
                SizedBox(
                  width: size * 0.45,
                  child: Text(
                    "By: Gemma Deeks",
                    style: TextStyle(
                        fontSize: size * 0.036,
                        fontWeight: FontWeight.bold,
                        color: AppColor.blackColor.withOpacity(0.8)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                ),

                Container(
                  width: 1,
                  height: size*0.09,
                  color: AppColor.blackColor,
                ),

                Expanded(
                  child: Center(
                    child: Text(
                     "Jun, 2024",
                     style: TextStyle(
                        fontSize: size * 0.036,
                        color: AppColor.blackColor.withOpacity(0.8)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                    )
                  )
                ),
              ],
            ),
          ),

          Container(
            height: 1,
            color: AppColor.blackColor.withOpacity(.1),
          ),
        ], 
      ),
    );
  }
}