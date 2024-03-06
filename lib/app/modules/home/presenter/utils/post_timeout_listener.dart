import 'dart:async';

import 'package:flutter/material.dart';

class PostTimeoutListener extends StatefulWidget {
  
  final Duration duration;
  final VoidCallback onTimeOut;
  const PostTimeoutListener({super.key, required this.duration, required this.onTimeOut});

  @override
  State<PostTimeoutListener> createState() => _PostTimeoutListenerState();
}

class _PostTimeoutListenerState extends State<PostTimeoutListener> {

  Timer? _timer;

  _startTimer(){
    print('Timer reset');
    if(_timer != null){
      _timer?.cancel();
      _timer = null;
    }

    _timer = Timer(widget.duration, () { 
      print('init timer');
      widget.onTimeOut();

    });
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
      if(_timer != null){
      _timer?.cancel();
      _timer = null;
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Listener(

      behavior: HitTestBehavior.translucent,

      onPointerDown: (event) {
        _startTimer();
      },
     
    );
  }
}