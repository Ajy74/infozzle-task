import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infozzle_task/configs/routes/route_name.dart';
import 'package:infozzle_task/views/login/login_screen.dart';
import 'package:infozzle_task/views/views.dart';


class AppRoutes {

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        name: RouteName.loginScreen,
        builder: (context, state) => const LoginScreen(),
        routes: [
          // GoRoute(
          //   path: "404",
          //   builder: (context, state) => PageNotFoundScreen(
          //     error: state.extra as String? ?? ' or you are not authorized..',
          //   ),
          // ),

          GoRoute(
            name: RouteName.registerScreen,
            path: "register",
            pageBuilder: (context, state) {
               return customPageRouteBuilder(
                const Placeholder(),
                state.pageKey,
                transitionDuration: const Duration(milliseconds: 500),
              );
            },
          ),


          GoRoute(
            name: RouteName.bottomNavScreen,
            path: "bottom",
            pageBuilder: (context, state) {
               return customPageRouteBuilder(
                const BottomNavScreen(),
                state.pageKey,
                transitionDuration: const Duration(milliseconds: 500),
              );
            },
          ),

          GoRoute(
            name: RouteName.homeScreen,
            path: "home",
            pageBuilder: (context, state) {
               return customPageRouteBuilder(
                const Placeholder(),
                state.pageKey,
                transitionDuration: const Duration(milliseconds: 500),
              );
            },
          ),

          GoRoute(
            name: RouteName.blogsScreen,
            path: "blogs/:category",
            pageBuilder: (context, state) {
               return customPageRouteBuilderBottomToTop(
                BlogsScreen(
                  title: state.pathParameters['category']!
                ),
                state.pageKey,
                transitionDuration: const Duration(milliseconds: 500),
              );
            },
          ),

          GoRoute(
            name: RouteName.blogScreen,
            path: "blog/:category",
            pageBuilder: (context, state) {
               return customPageRouteBuilderBottomToTop(
                BlogScreen(
                  title: state.pathParameters['category']!
                ),
                state.pageKey,
                transitionDuration: const Duration(milliseconds: 500),
              );
            },
          ),


          GoRoute(
            name: RouteName.contactScreen,
            path: "contact",
            pageBuilder: (context, state) {
               return customPageRouteBuilderBottomToTop(
                const Placeholder(),
                state.pageKey,
                transitionDuration: const Duration(milliseconds: 500),
              );
            },
          ),

        ]
      ),
    ]
  );

}

CustomTransitionPage customPageRouteBuilder(Widget page, LocalKey pageKey, {required Duration transitionDuration}) {
  return CustomTransitionPage(
    key: pageKey,
    child: page,
    fullscreenDialog: true,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
    transitionDuration: transitionDuration,
  );
}


CustomTransitionPage customPageRouteBuilderBottomToTop(Widget page, LocalKey pageKey, {required Duration transitionDuration}) {
  return CustomTransitionPage(
    key: pageKey,
    child: page,
    fullscreenDialog: true,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
    transitionDuration: transitionDuration,
  );
}