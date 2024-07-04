import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infozzle_task/bloc/all-posts/posts_cubit.dart';
import 'package:infozzle_task/configs/color/color.dart';
import 'package:infozzle_task/configs/routes/route_name.dart';


class BlogsScreen extends StatelessWidget {
  final String title;
  final String id;
  const BlogsScreen({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => PostsCubit()..fetchAllPost(int.parse(id)),
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
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
                  fontSize: size * 0.07),
            ),
          ),
        ),
        body: Column(
          children: [
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: size * 0.06),
            //   width: size,
            //   alignment: Alignment.center,
            //   child: Text(
            //     "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            //     style: TextStyle(color: AppColor.blackColor, fontSize: size * 0.036),
            //     maxLines: 3,
            //     overflow: TextOverflow.ellipsis,
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            
            SizedBox(
              height: size * 0.03,
            ),

            Expanded(
              child: BlocBuilder<PostsCubit, PostsState>(
                builder: (context, state) {
                  if (state is PostsLoadingState) {
                    return const Center(child: CircularProgressIndicator(color: AppColor.blackColor,));
                  } else if (state is PostsLoadedState) {
                    return ListView.builder(
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        final post = state.posts[index];
                        return InkWell(
                          onTap: () {
                            context.pushNamed(
                              RouteName.blogScreen,
                              pathParameters: {
                                "image": post.featuredImage!, 
                                "id": post.id!.toString(),
                              },
                            );
                          },
                          child: blogContainer(
                            post.featuredImage!,
                            post.shortContent!, 
                            size,
                          ),
                        );
                      },
                    );
                  } else if (state is PostsErrorState) {
                    return Center(child: Text(state.message));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget blogContainer(String image, String caption, double size) {
    return Container(
      height: size * 0.75,
      width: size,
      margin: EdgeInsets.symmetric(horizontal: size * 0.04, vertical: size * 0.03),
      child: Column(
        children: [
          SizedBox(
            width: size,
            height: size * 0.5,
            child: Hero(
              tag: image,
              child: Image.network(
                image,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } 
                  else {
                    return Container(
                      color: AppColor.greyColor.withOpacity(.2),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColor.blackColor,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: size * 0.03, horizontal: size * 0.03),
            width: size,
            alignment: Alignment.center,
            child: Text(
              caption,
              style: TextStyle(color: AppColor.blackColor, fontSize: size * 0.036),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),

          Container(
            width: size,
            alignment: Alignment.center,
            child: Text(
              "Read More",
              style: TextStyle(
                  color: AppColor.blackColor,
                  fontSize: size * 0.036,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
