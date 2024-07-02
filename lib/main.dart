import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infozzle_task/configs/color/color.dart';
import 'package:infozzle_task/configs/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Infozzle Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.primaryColor,
        ),
        useMaterial3: true,

        textTheme: getTextThemes(),
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          foregroundColor: AppColor.blackColor,
          backgroundColor: AppColor.whiteColor
          // systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        ),
      ),
      routerConfig: AppRoutes.router,
    );
  }
}


//& function for getting text theme over whole app
  TextTheme getTextThemes() {
    return  GoogleFonts.domineTextTheme(const TextTheme(
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(fontWeight: FontWeight.w400)
    ));
  }


//& Function to create a MaterialColor from a single color
  MaterialColor createMaterialColor(Color color) {
    List<Color> shades = [
      color,
      Color.lerp(color, Colors.black, 0.1)!,
      Color.lerp(color, Colors.black, 0.2)!,
      Color.lerp(color, Colors.black, 0.3)!,
      Color.lerp(color, Colors.black, 0.4)!,
      Color.lerp(color, Colors.black, 0.5)!,
      Color.lerp(color, Colors.black, 0.6)!,
      Color.lerp(color, Colors.black, 0.7)!,
      Color.lerp(color, Colors.black, 0.8)!,
      Color.lerp(color, Colors.black, 0.9)!,
    ];

    return MaterialColor(color.value, {
      50: shades[0],
      100: shades[1],
      200: shades[2],
      300: shades[3],
      400: shades[4],
      500: shades[5],
      600: shades[6],
      700: shades[7],
      800: shades[8],
      900: shades[9],
    });
  }