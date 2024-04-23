import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';

import '../../../../core/domain/services/notifications_service.dart';
import '../../../../core/presentation/snackbar.dart';
import '../../../../core/presentation/widgets/my_scaffold.dart';
import '../../../../environment.dart';
import '../../../../injection_container.dart';
import '../../domain/services/call_service.dart';


AgoraClient getClient({required String rtcToken, required int agoraUid, required String channelName}) => AgoraClient(
  agoraConnectionData: AgoraConnectionData(
    appId: Environment.agoraAppId,
    channelName: channelName,
    tempToken: rtcToken,
    uid: agoraUid,
    // uid: null // do not set the uid to make it work
  ),
  enabledPermission: [
    Permission.camera,
    Permission.microphone,
  ],
);



class CallScreen extends StatefulWidget {
  static const String route = '/call';
final String conversationId;
  const CallScreen({super.key, required this.conversationId});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  
  bool initialized = false;
  bool disposed = false;
  AgoraClient? agoraClient;

  @override
  void didChangeDependencies() {
    init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      background: defaultBackground,
      padding: EdgeInsets.zero,
      body: !initialized ? Container() : Stack(
        children: [
          if (agoraClient == null)
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * .25,),
                  const Text('Almost there!\nIt will take only a few seconds', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
                ],
              ),
            ),
          if (agoraClient != null)
            Expanded(
              child: Stack(
                children: [
                  AgoraVideoViewer(
                    client: agoraClient!,
                    layoutType: Layout.grid,
                    showNumberOfUsers: true,
                  ),
                  AgoraVideoButtons(client: agoraClient!),
                ],
              ),
            )
        ],
      ),
    );
  }

  @override
  void dispose() {
    disposed = true;
    getIt.get<NotificationsService>().ignoreNotificationsForConversationId(conversationId: null);
    super.dispose();
  }

  void init() {
    if (initialized) return;
    initialized = true;
    // assert(ModalRoute.of(context)!.settings.arguments != null, "Please, inform the arguments. More info on https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments#4-navigate-to-the-widget");
    getIt.get<NotificationsService>().ignoreNotificationsForConversationId(conversationId: widget.conversationId);
    if (agoraClient == null) {
      getIt.get<CallService>().getCallCredentials(conversationId: widget.conversationId)
          .then((res) {
        setState(() {
          if (!res.success) {
            Navigator.of(context).pop();
            showSnackBarWarning(message: "An error occurred, please try again later");
            return;
          }
          agoraClient = getClient(rtcToken: res.data!.rtcToken, agoraUid: res.data!.agoraUid, channelName:  widget.conversationId);
          // agoraClient!.engine.getUserInfoByUserAccount(userAccount)
          agoraClient!.engine.setParameters("{\"rtc.log_filter\": 65535}");
          agoraClient!.initialize();
        });
      });
    }
    setState(() {});
  }
}