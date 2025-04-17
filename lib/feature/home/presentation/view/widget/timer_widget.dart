import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vpn_basic_project/core/utilis/app_style/app_text_styles.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key, required this.initTimerNow});
  final bool initTimerNow;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Duration duration=Duration();
  Timer? timer;
  startTimerNow(){
    timer=Timer.periodic(Duration(seconds: 1),(timer){
      setState(() {
        duration=Duration(seconds: duration.inSeconds+1);
      });
    });
  }
  stopTimerNow(){
    timer?.cancel();
    timer=null;
    duration=Duration();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    if (timer==null||!widget.initTimerNow){
      widget.initTimerNow?startTimerNow():stopTimerNow();
    }
    String twoDigit(int num)=>num.toString().padLeft(2,"0");
    final minutes=twoDigit(duration.inMinutes.remainder(60));
    final seconds=twoDigit(duration.inSeconds.remainder(60));
    final hour=twoDigit(duration.inHours.remainder(60));
    return Text("$hour : $minutes:$seconds",style: textStyle.Bold19,);
  }

}
