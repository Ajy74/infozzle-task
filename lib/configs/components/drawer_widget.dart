import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infozzle_task/bloc/drawer-cubit/drawer_cubit.dart';
import 'package:infozzle_task/configs/color/color.dart';
import 'package:infozzle_task/configs/routes/route_name.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    const double appBarHeight = kToolbarHeight;

    return BlocProvider(
      create: (context) => DrawerCubit()..fetchDrawerItems(),
      child: Drawer(
        shape: const RoundedRectangleBorder(),
        backgroundColor: AppColor.whiteColor,
        surfaceTintColor: AppColor.whiteColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            //~ top section
            Container(
              padding: EdgeInsets.only(top: statusBarHeight),
              height: statusBarHeight + appBarHeight,
              decoration: const BoxDecoration(
                color: AppColor.whiteColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/icons/logo.png",
                      height: appBarHeight * 0.6,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: AppColor.blackColor),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              color: AppColor.blackColor.withOpacity(.1),
            ),


            BlocBuilder<DrawerCubit, DrawerState>(
              builder: (context, state) {
                if (state is DrawerLoadingState) {
                  return Padding(
                    padding: EdgeInsets.only(top: size*0.03),
                    child: const Center(child: CircularProgressIndicator(strokeWidth: 3,))
                  );
                } else if (state is DrawerLoadedState) {
                  return Column(
                    children: state
                    .items
                    .map((item) => drawerListContainer(item.name!, item.id!,context,size))
                    .toList(),
                  );
                } else if (state is DrawerErrorState) {
                  return const SizedBox();
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            
            drawerListContainer("Support",-1,context, size),
          ],
        ),
      ),
    );
  }

  Widget drawerListContainer(String title, int id, BuildContext context, double size) {
    return Column(
      children: [
        ListTile(
          minVerticalPadding: 0,
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColor.blackColor,
          ),
          title: Text(
            title,
            style: TextStyle(color: AppColor.blackColor, fontSize: size * 0.05),
          ),
          onTap: () {
            if(title != "Support"){
              context.pushNamed(
                RouteName.blogsScreen,
                pathParameters: {
                  "category": title,
                  "id": id.toString(),
                }, 
              );
            }
            else{
              context.pushNamed(RouteName.contactScreen);
            }
          },
        ),
        Container(
          height: size * 0.02,
          color: AppColor.greyColor.withOpacity(.1),
        ),
      ],
    );
  }
}
