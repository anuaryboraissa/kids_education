import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mathgame/src/core/color_scheme.dart';
import 'package:provider/provider.dart';

import '../../core/app_assets.dart';
import '../../ui/app/theme_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Settings',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(top: 10),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Common",
                              // style: TextStyle(color: AppS)
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          context.read<ThemeProvider>().changeTheme();
                        },
                        title: Text("App Theme"),
                        leading: Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.infoDialogBgColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          padding: const EdgeInsets.only(
                              right: 12, top: 12, bottom: 12, left: 8),
                          child: SvgPicture.asset(
                            Theme.of(context).brightness == Brightness.light
                                ? AppAssets.icDarkMode
                                : AppAssets.icLightMode,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) => const NotificatioSetting(),
                          // ));
                        },
                        leading: const Icon(Icons.notifications),
                        title: const Text("Notifications"),
                        subtitle: const Text("group,chats"),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 14,
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) => const StorageSetting(),
                          // ));
                        },
                        leading: const Icon(Icons.storage),
                        title: const Text("Storing data"),
                        subtitle:
                            const Text("network usage and auto downloads"),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 14,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Account",
                              // style: AppColors.headingStyle
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.phone),
                        title: const Text("Phone Number"),
                        subtitle: Text("0734328981"),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 14,
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.mail),
                        title: const Text("UserName"),
                        subtitle: Text("Anuary"),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 14,
                        ),
                      ),
                      const Divider(),
                      const ListTile(
                        leading: Icon(Icons.delete),
                        title: Text("Delete My Account"),
                        subtitle: Text("this may delete your Tuchati account"),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 14,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Security",
                              // style: AppColors.headingStyle
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.phonelink_lock_outlined),
                        title: const Text("Lock app in background"),
                        trailing: Switch(
                            value: true,
                            activeColor: Colors.redAccent,
                            onChanged: (val) {
                              setState(() {
                                // lockAppSwitchVal = val;
                              });
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Misc",
                              // style: AppColors.headingStyle
                            ),
                          ],
                        ),
                      ),
                      const ListTile(
                        leading: Icon(Icons.file_open_outlined),
                        title: Text("Terms of Service"),
                      ),
                      const Divider(),
                      const ListTile(
                        leading: Icon(Icons.file_copy_outlined),
                        title: Text("Open Source and Licences"),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(Icons.help),
                        title: Text("Help"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
