import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mathgame/src/core/app_constant.dart';
import 'package:mathgame/src/core/app_routes.dart';
import 'package:mathgame/src/core/app_theme.dart';
import 'package:mathgame/src/ui/app/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../chat/core/domain/services/notifications_service.dart';
import '../../../chat/core/presentation/widgets/person_icon.dart';
import '../../../chat/injection_container.dart';

class MyApp extends StatelessWidget {
  final String fontFamily = "Montserrat";
  final double height = 100;
  final ValueNotifier<RemoteMessage?> notificationNotifier =
      ValueNotifier(null);
  final PanelController topNotificationController = PanelController();
  late  Function() unsubscribeOnMessageOpenedApp;
   MyApp({
    Key? key,
    
  }){
      unsubscribeOnMessageOpenedApp = getIt
        .get<NotificationsService>()
        .onMessageOpenedApp(_onMessageOpenedApp);

    // If the app was completed closed and the notification was clicked
    FirebaseMessaging.instance.getInitialMessage().then((remoteMessage) {
      if (remoteMessage != null) {
        getIt.get<NotificationsService>().onNotificationClicked(remoteMessage);
      }
    });
  }

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
    Timer? _closeNotificationAutomatically;
  void _onMessageOpenedApp(RemoteMessage event) {
    notificationNotifier.value = event;
    topNotificationController.open();

    _closeNotificationAutomatically?.cancel();
    _closeNotificationAutomatically = Timer(const Duration(seconds: 5), () {
      topNotificationController.close();
    });
  }
}

class _RemoteMessageContent extends StatelessWidget {
  final RemoteMessage notification;
  final void Function() onTap;

  const _RemoteMessageContent(
      {required this.notification,
      required void Function() this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          child: Row(
            children: [
              const PersonIcon(isGroup: false, iconSize: 30),
              const SizedBox(
                width: 13,
              ),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(flex: 5, child: Container()),
                      Text(notification.notification!.title!,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 17,
                              color: Colors.blue[900],
                              fontWeight: FontWeight.w700)),
                      Flexible(flex: 1, child: Container()),
                      Text(notification.notification!.body!,
                          maxLines: 2,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 16,
                              color: Colors.blue[800],
                              fontWeight: FontWeight.w500)),
                      Flexible(flex: 5, child: Container()),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}