import 'package:flutter/material.dart';
import 'package:infozzle_task/configs/color/color.dart';


class BlogTopSection extends StatelessWidget {
  final String image;

  const BlogTopSection({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;

    return Container(
      height: size*0.5,
      width: size,
      margin: EdgeInsets.only(left: size*0.04,right: size*0.04,top: size*0.04,bottom: size*0.09),
      color: AppColor.greyColor.withOpacity(.2),
      child: Column(
        children: [
          SizedBox(
            width: size,
            height: size*0.5,
            child: Hero(
              tag: image,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}