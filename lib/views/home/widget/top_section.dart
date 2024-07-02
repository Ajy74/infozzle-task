import 'package:flutter/material.dart';
import 'package:infozzle_task/configs/color/color.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: size*0.03),
      child: Column(
        children: [
          SizedBox(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      
                    },
                    child:  catContainer("assets/images/travel.png","Travel",size),
                  )
                ),
                SizedBox(width: size*0.03,),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      
                    },
                    child: catContainer("assets/images/style.png","Style",size),
                  )
                ),
              ],
            ),
          ),
          SizedBox(height: size*0.02,),
          SizedBox(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      
                    },
                    child:  catContainer("assets/images/beauty.png","Beauty",size),
                  )
                ),
                SizedBox(width: size*0.03,),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      
                    },
                    child:  catContainer("assets/images/culture.png","Culture",size),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  catContainer(String image, String title,double size) {
    return Column(
      children: [
        Container(
          height: size*0.35,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.blackColor),
            borderRadius: BorderRadius.circular(12)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.symmetric(vertical: size*0.03),
          child: Text(
            title,
            style: TextStyle(
              color: AppColor.blackColor,
              fontWeight: FontWeight.bold,
              fontSize: size*0.04
            ),
          ),
        ),
      ],
    );
  }
}