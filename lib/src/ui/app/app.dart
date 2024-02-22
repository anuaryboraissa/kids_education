import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mathgame/src/core/app_constant.dart';
import 'package:mathgame/src/core/app_routes.dart';
import 'package:mathgame/src/core/app_theme.dart';
import 'package:mathgame/src/ui/app/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatelessWidget {
  final String fontFamily = "Montserrat";

  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Consumer<ThemeProvider>(
        builder: (context, ThemeProvider provider, child) {
      return Sizer(
         builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Kids Math',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme,
            darkTheme: AppTheme.darkTheme,
            themeMode: provider.themeMode,
            initialRoute: KeyUtil.splash,
            routes: appRoutes,
            // home: DashboardView(),
            navigatorObservers: [
            ],
          );
        }
      );
    });
  }
}
