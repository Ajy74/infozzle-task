import 'package:flutter/material.dart';
import 'package:infozzle_task/configs/color/color.dart';
import 'package:infozzle_task/configs/components/appbar_widget.dart';
import 'package:infozzle_task/configs/components/drawer_widget.dart';
import 'package:infozzle_task/views/blogs/widget/blog_widget.dart';

class BlogScreen extends StatelessWidget {
  final String title;
  const BlogScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),

      drawer: const DrawerWidget(),
      
      body: ListView(
        children: [
          BlogTopSection(
            image: "assets/images/post.png", 
            caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry", 
            title: title
          ),

          const AuthorSection(),
          SizedBox(height: size*0.03,),
          
          Container(
            margin: EdgeInsets.symmetric(vertical: size*0.04,horizontal: size*0.03),
            width: size,
            alignment: Alignment.centerLeft,
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
              style: TextStyle(
                color: AppColor.blackColor,
                fontSize: size*0.036
              ),
              textAlign: TextAlign.left,
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: size*0.04,horizontal: size*0.03),
            width: size,
            alignment: Alignment.centerLeft,
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
              style: TextStyle(
                color: AppColor.blackColor,
                fontSize: size*0.036
              ),
              textAlign: TextAlign.left,
            ),
          ),
          
          SizedBox(height: size*0.03,),
          Container(
            width: size,
            alignment: Alignment.center,
            child: Text(
              "You may also like",
              style: TextStyle(
                color: AppColor.blackColor.withOpacity(.8),
                fontWeight: FontWeight.bold,
                fontSize: size*0.07
              ),
            ),
          ),

          const OtherPostSection(),

        ],
      ),
    );
  }
}