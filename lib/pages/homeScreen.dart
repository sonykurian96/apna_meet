import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';

import 'package:video_chat/pages/joinWithCodePage.dart';

/* TO-DO
* Drawer    -- not needed actually 
* BottomSheet --half done
 */

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            Text("Meet", style: TextStyle(color: Colors.black, fontSize: 20)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {},
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              ElevatedButton(
                  onPressed: () {
                    showAdaptiveActionSheet(
                      context: context,
                      actions: <BottomSheetAction>[
                        BottomSheetAction(
                          title: SizedBox(
                            height: 35,
                            child: const ListTile(
                              leading: Icon(Icons.link),
                              title: Text("Get a meeting link to share"),
                            ),
                          ),
                          onPressed: () {},
                        ),
                        BottomSheetAction(
                          title: SizedBox(
                            height: 35,
                            child: const ListTile(
                              leading: Icon(Icons.video_camera_front_sharp),
                              title: Text("Start an Instant meeting"),
                            ),
                          ),
                          onPressed: () {},
                        ),
                        BottomSheetAction(
                          title: SizedBox(
                            height: 35,
                            child: const ListTile(
                              leading: Icon(Icons.calendar_today_sharp),
                              title: Text("Schedule in Google Calendar"),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                      cancelAction: CancelAction(
                          title: SizedBox(
                        height: 35,
                        child: const ListTile(
                          leading: Icon(Icons.close),
                          title: Text("Close"),
                        ),
                      )),
                    );
                  },
                  child: Text("New Meeting", style: TextStyle(fontSize: 20))),
              SizedBox(width: 15),
              Expanded(
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> JoinWithCodeScreen(),
                      )
                      );
                    },
                    child:
                        Text("Join with a code", style: TextStyle(fontSize: 20))),
              )
            ],
          ),
          SizedBox(height: 50),
          Expanded(child: Image.asset("assets/homePageImage.jpeg")),
        ],
      ),
    );
  }
}
