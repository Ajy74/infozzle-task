import 'package:flutter/material.dart';


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
      height: size*0.55,
      width: size,
      margin: EdgeInsets.symmetric(horizontal: size*0.04,vertical: size*0.04),
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