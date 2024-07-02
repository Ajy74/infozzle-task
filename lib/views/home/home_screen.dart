
import 'package:flutter/material.dart';
import 'package:infozzle_task/configs/color/color.dart';
import 'package:infozzle_task/configs/components/appbar_widget.dart';
import 'package:infozzle_task/configs/components/drawer_widget.dart';
import 'package:infozzle_task/views/home/widget/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),

      drawer: const DrawerWidget(),

      body: ListView(
        children:  [
          SizedBox(height: size*0.06,),
          const TopSection(),

          SizedBox(height: size*0.03,),
          Container(
            width: size,
            alignment: Alignment.center,
            child: Text(
              "Latest Podcast",
              style: TextStyle(
                color: AppColor.blackColor.withOpacity(.8),
                fontWeight: FontWeight.bold,
                fontSize: size*0.07
              ),
            ),
          ),
          const PodcastSection(),

          //~ banner
          Container(
            height: size*0.35,
            margin: EdgeInsets.symmetric(horizontal: size*0.03,vertical: size*0.03),
            child: Image.asset(
              "assets/images/banner.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
