import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mathgame/chat/features/login_and_registration/presentation/screens/login_and_registration_screen.dart';
import 'package:sizer/sizer.dart';

import '../../../chat/core/domain/services/auth_service.dart';
import '../../../chat/core/domain/services/notifications_service.dart';
import '../../../chat/features/chat/presentation/screens/realtime_conversations_screen/realtime_conversations_screen.dart';
import '../../../chat/injection_container.dart';
import 'base_screen.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _start(context);
    });
  }
  void _start(BuildContext context) {
    if (getIt.get<AuthService>().isAuthenticated) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => BaseScreen(),), (_) => false);
      getIt.get<NotificationsService>().start();
    } else {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginAndRegistrationScreen(),), (_) => false);
    }
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
