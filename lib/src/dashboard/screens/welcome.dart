import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //its a row with a column
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: Theme.of(context).brightness==Brightness.dark?SystemUiOverlayStyle.light: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('School',
                        style: Theme.of(context).textTheme.headline5),
                    Text('Brain', style: Theme.of(context).textTheme.headline5),
                  ],
                ),
                Image.asset(
                  'assets/images/splash.png',
                  //25% of height & 50% of width
                  height: 25.h,
                  width: 50.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
