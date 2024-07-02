import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    return AppBar(
      scrolledUnderElevation: 0,
        centerTitle: true,
        title: SizedBox(
          width: size*0.5,
          child: Image.asset("assets/icons/logo.png"),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return InkWell(
              child: Icon(Icons.menu,size: size*0.09,),
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search,size: size*0.08),
            onPressed: () {
              
            },
          ),

          SizedBox(width: size*0.01,)
        ],
      );
  }
}