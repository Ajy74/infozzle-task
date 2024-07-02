import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infozzle_task/configs/color/color.dart';
import 'package:infozzle_task/configs/routes/route_name.dart';

class BlogsScreen extends StatelessWidget {
  final String title;
  const BlogsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Container(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: AppColor.blackColor,
              fontWeight: FontWeight.bold,
              fontSize: size*0.07
            ),
          ),
        ),
      ),

      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: size*0.06),
            width: size,
            alignment: Alignment.center,
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
              style: TextStyle(
                color: AppColor.blackColor,
                fontSize: size*0.036
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: size*0.03,),

          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                     context.pushNamed(
                        RouteName.blogScreen,
                        pathParameters: {
                          "category": title
                        },
                      );
                  },
                  child: blogContainer(
                    "assets/images/post.png",
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                    size
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  
  Widget blogContainer(String image, String caption, double size) {
    return Container(
      height: size*0.75,
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
            margin: EdgeInsets.symmetric(vertical: size*0.03,horizontal: size*0.03),
            width: size,
            alignment: Alignment.center,
            child: Text(
              caption,
              style: TextStyle(
                color: AppColor.blackColor,
                fontSize: size*0.036
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),

          Container(
            // margin: EdgeInsets.symmetric(vertical: size*0.03,horizontal: size*0.03),
            width: size,
            alignment: Alignment.center,
            child: Text(
              "Read More",
              style: TextStyle(
                color: AppColor.blackColor,
                fontSize: size*0.036,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}