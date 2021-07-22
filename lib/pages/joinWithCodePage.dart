import 'package:flutter/material.dart';
import 'package:video_chat/pages/videoCallScreen.dart';

class JoinWithCodeScreen extends StatefulWidget {

  @override
  _JoinWithCodeScreenState createState() => _JoinWithCodeScreenState();
}

class _JoinWithCodeScreenState extends State<JoinWithCodeScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Text("Join with a code",style: TextStyle(color: Colors.black)),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.blue,
              primary: Colors.white
            ),
            onPressed: (){
              print(_controller.text.trim());
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>VideoCall(channel: _controller.text.trim()),
              )
              );
            },
            child: Text("Join"),
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text("Enter the code provided by the meeting organizer",style: TextStyle(fontSize: 16),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                fillColor: Colors.grey,
                border: OutlineInputBorder(),
                hintText: "Example : abc-def-ghw"
              ),
            ),
          )
        ],
      ),
    );
  }
}


