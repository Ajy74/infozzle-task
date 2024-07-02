import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infozzle_task/configs/color/color.dart';
import 'package:infozzle_task/configs/components/appbar_widget.dart';
import 'package:infozzle_task/configs/components/drawer_widget.dart';
import 'package:infozzle_task/configs/routes/route_name.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  final catImages = [
      "assets/images/travel.png",
      "assets/images/style.png",
      "assets/images/beauty.png",
      "assets/images/culture.png",
  ];
  final catTitle = ["Travel", "Style", "Beauty", "Culture"];
  
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
      
      body: Column(
        children: [
          SizedBox(height: size*0.04,),
          Container(
            width: size,
            alignment: Alignment.center,
            child: Text(
              "Categories",
              style: TextStyle(
                color: AppColor.blackColor.withOpacity(.7),
                fontWeight: FontWeight.bold,
                fontSize: size*0.07
              ),
            ),
          ),
          SizedBox(height: size*0.03,),

          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: size*0.03),
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: catContainer(
                      catImages[index],
                      catTitle[index],
                      size
                    ),
                    onTap: () {
                      context.pushNamed(
                        RouteName.blogsScreen,
                        pathParameters: {
                          "category": catTitle[index]
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget catContainer(String image, String title, double size) {
    return Container(
      margin: EdgeInsets.only(top: size*0.03,bottom: size*0.03),
      height: size*0.45,
      decoration: BoxDecoration(
        color: AppColor.greyColor,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(image,fit: BoxFit.cover,),
          ),
          Container(
            // color: AppColor.whiteColor.withOpacity(.2),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColor.blackColor.withOpacity(.01),
                  AppColor.blackColor.withOpacity(.02),
                  AppColor.whiteColor.withOpacity(.2),
                  AppColor.whiteColor.withOpacity(.3),
                  AppColor.whiteColor.withOpacity(.3),
                  AppColor.whiteColor.withOpacity(.3),
                  AppColor.whiteColor.withOpacity(.3),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight
              )
            ),
          ),

          Positioned(
            top: size*0.03,
            left: size*0.03,
            child: Text(
              title,
              style: TextStyle(
                fontSize: size*0.05,
                color: AppColor.whiteColor,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          Positioned(
            bottom: size*0.03,
            left: size*0.03,
            child: Row(
              children: [
                Text(
                  "View",
                  style: TextStyle(
                    fontSize: size*0.04,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width: size*0.01,),
                const Icon(Icons.arrow_forward_rounded,color: AppColor.whiteColor,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}