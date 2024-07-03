import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infozzle_task/configs/color/color.dart';

class OtherPostSection extends StatelessWidget {
  const OtherPostSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;

    return Container(
      height: size*0.6,
      margin: EdgeInsets.symmetric(vertical: size*0.06),
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return podContainer(
            "assets/images/post.png",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            size,
            index+1 == 10
          );
        },
      ),
    );
  }
  
  Widget podContainer(String image, String desciption, double size, bool isLast) {
    return Container(
      width: size*0.5,
      margin: EdgeInsets.only(left: size*0.03, right: isLast ? size*0.03 : 0),
      child:  Column(
        children: [
          SizedBox(
            height: size*0.32,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: size*0.03),
            child: Text(
              desciption,
              style: TextStyle(
                color: AppColor.blackColor,
                fontSize: size*0.036
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      )
    );
  }
}