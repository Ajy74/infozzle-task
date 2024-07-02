import 'package:flutter/material.dart';
import 'package:infozzle_task/configs/color/color.dart';

class BlogTopSection extends StatelessWidget {
  final String image;
  final String title;
  final String caption;

  const BlogTopSection({
    super.key,
    required this.image,
    required this.caption,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;

    return Container(
      height: size*0.73,
      width: size,
      margin: EdgeInsets.symmetric(horizontal: size*0.04,vertical: size*0.03),
      child: Column(
        children: [
          SizedBox(
            width: size,
            height: size*0.5,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: size*0.04,bottom: size*0.02),
            width: size,
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                color: AppColor.blackColor,
                fontSize: size*0.036
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
            ),
          ),


          Container(
            // margin: EdgeInsets.symmetric(vertical: size*0.04,horizontal: size*0.03),
            width: size,
            alignment: Alignment.centerLeft,
            child: Text(
              caption,
              style: TextStyle(
                color: AppColor.blackColor,
                fontSize: size*0.036
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
            ),
          ),

        ],
      ),
    );
  }
}