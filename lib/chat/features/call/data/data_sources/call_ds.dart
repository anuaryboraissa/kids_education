import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/call_credentials.dart';

class CallDS {
  final FirebaseFunctions firebaseFunctions;
  CallDS({required this.firebaseFunctions});

  Future<CallCredentials> getCallCredentials(
      {required String conversationId}) async {
    try {
      final res = await FirebaseFunctions.instance
          .httpsCallable("getCallCredentials")
          .call({
        "conversationId": conversationId,
      });
      debugPrint("Data: here is my data =====> ${res.data}");
      if (res.data != null && res.data["rtcToken"] != null) {
        return CallCredentials(
            data: CallCredentialsData(
          agoraUid: res.data["agoraUid"],
          rtcToken: res.data["rtcToken"],
        ));
      }
      print("getCallCredentials: An error occurred");
      return CallCredentials();
    } catch (e) {
      print("getCallCredentials: An error occurred: ${e.toString()}");
      return CallCredentials();
    }
  }
}
