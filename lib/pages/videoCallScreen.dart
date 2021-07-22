import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:video_chat/keys.dart';

class VideoCall extends StatefulWidget {

  String channel = "test";

  VideoCall({Key? key,required this.channel}):super(key: key);

  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  late final AgoraClient client;
  bool _loading = true;

  String token = "not Initialized yet";

  Future<void> getToken() async {
    String link = tokenLink+widget.channel;
    try {
      print("entered try block");
      Response response = await get(Uri.parse(link));
      Map data = jsonDecode(response.body);
      setState(() {
        token = data['rtcToken'];
      });
      client = AgoraClient(
        agoraConnectionData: AgoraConnectionData(
            appId: appID,
            channelName: widget.channel,
            tempToken: token
        ),
        enabledPermission: [Permission.camera, Permission.microphone],
      );
      Future.delayed(Duration(seconds: 1))
          .then((value) => {setState(() => _loading = false)});
    }
    catch(e){
      print(e.toString());
    }
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  AgoraVideoViewer(
                    client: client,
                    layoutType: Layout.floating
                  ),
                  AgoraVideoButtons(client: client)
                ],
              ),
      ),
    );
  }
}
