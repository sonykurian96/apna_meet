import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:http/http.dart';
import 'dart:convert';
// b0e365c43831480fbf8511dac9065e47

// fake temp - 0063a4f546b071b475eb264149635d0cb64IACtTJcHl+uJCwDIY9FI5SKMXHBvE5B3BcTjKjHghPHJkgx+f9gAAAAAEABHt5qCbnD2YAEAAQD+LPVg

// real temp - 006b0e365c43831480fbf8511dac9065e47IACcrvmvEvwgFsbpgOKVVVKY0UnxTLKOMyOt7jx5Op4oWwx+f9gAAAAAEAAApPzoxG72YAEAAQDEbvZg

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
    String link = "https://video-call-server-beta.herokuapp.com/access_token?channelName=${widget.channel}";
    try {
      print("entered try block");
      Response response = await get(Uri.parse(link));
      Map data = jsonDecode(response.body);
      setState(() {
        token = data['rtcToken'];
      });
      client = AgoraClient(
        agoraConnectionData: AgoraConnectionData(
            appId: "b0e365c43831480fbf8511dac9065e47",
            channelName: widget.channel,
            tempToken: token
          // tokenUrl: "https://video-call-server-beta.herokuapp.com/access_token?channelName=test"
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
