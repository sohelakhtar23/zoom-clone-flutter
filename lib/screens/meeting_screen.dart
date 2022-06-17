import 'dart:math';

import "package:flutter/material.dart";
import 'package:zoom_clone/services/jitsi_meet_methods.dart';

import '../widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(100000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
      roomName: roomName,
      isAudioMuted: true,
      isVedioMuted: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButtton(
              icon: Icons.videocam,
              text: 'New Meeting',
              onPressed: createNewMeeting,
            ),
            HomeMeetingButtton(
              icon: Icons.add_box_rounded,
              text: 'Join Meeting',
              onPressed: () {
                Navigator.pushNamed(context, '/video-call');
              },
            ),
            HomeMeetingButtton(
              icon: Icons.calendar_today,
              text: 'Schedule',
              onPressed: () {},
            ),
            HomeMeetingButtton(
              icon: Icons.arrow_upward_rounded,
              text: 'Share Screen',
              onPressed: () {},
            ),
          ],
        ),
        const Expanded(
          child: Center(
              child: Text(
            'Create/Join meetings with just a click!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          )),
        ),
      ],
    );
  }
}
