import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:infozzle_task/bloc/single-post/post_cubit.dart';
import 'package:infozzle_task/configs/color/color.dart';
import 'package:infozzle_task/configs/components/appbar_widget.dart';
import 'package:infozzle_task/configs/components/drawer_widget.dart';
import 'package:infozzle_task/utils/url_launcher.dart';
import 'package:infozzle_task/views/blogs/widget/blog_widget.dart';

class BlogScreen extends StatelessWidget {
  final String image;
  final String id;
  const BlogScreen({super.key, required this.image, required this.id});

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => PostCubit()..fetchSinglePost(int.parse(id)),
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarWidget(),
        ),
        drawer: const DrawerWidget(),
        body: ListView(
          children: [
            BlogTopSection(
              image: image,
            ),
            const AuthorSection(),

            SizedBox(
              height: size * 0.03,
            ),

            Container(
              margin: EdgeInsets.symmetric(
                  vertical: size * 0.04, horizontal: size * 0.03),
              width: size,
              alignment: Alignment.centerLeft,
              child: BlocBuilder<PostCubit, PostState>(
                builder: (context, state) {
                  if(state is PostLoadingState && state is PostErrorState){
                    return const Center(child: CircularProgressIndicator(color: AppColor.blackColor,),);
                  }
                  if(state is PostLoadedState){
                    // return Text(
                    //   state.post.title!,
                    //   style: TextStyle(
                    //       color: AppColor.blackColor, 
                    //       fontSize: size * 0.036,
                    //       fontWeight: FontWeight.bold
                    //   ),
                    //   textAlign: TextAlign.left,
                    // );
                    return HtmlWidget(
                      state.post.title!,
                      textStyle: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: size * 0.06,
                        fontWeight: FontWeight.bold
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator(color: AppColor.blackColor,),);
                },
              ),
            ),
            
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: size * 0.04, horizontal: size * 0.03),
              width: size,
              alignment: Alignment.centerLeft,
              child: BlocBuilder<PostCubit, PostState>(
                builder: (context, state) {
                  if(state is PostLoadedState){
                    // return Text(
                    //   state.post.content!,
                    //   style: TextStyle(
                    //       color: AppColor.blackColor, fontSize: size * 0.036),
                    //   textAlign: TextAlign.left,
                    // );
                    return HtmlWidget(
                      state.post.content!,
                      onTapUrl: (url) async{
                        await checkUrl(url , context);
                        return true;
                      },
                      enableCaching: true,
                      onLoadingBuilder: (context, element, loadingProgress) {
                        return const Center(child: CircularProgressIndicator(color: AppColor.blackColor,),);
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),

            SizedBox(
              height: size * 0.03,
            ),


            // Container(
            //   width: size,
            //   alignment: Alignment.center,
            //   child: Text(
            //     "You may also like",
            //     style: TextStyle(
            //         color: AppColor.blackColor.withOpacity(.8),
            //         fontWeight: FontWeight.bold,
            //         fontSize: size * 0.07),
            //   ),
            // ),
            // const OtherPostSection(),
          ],
        ),
      ),
    );
  }
}
