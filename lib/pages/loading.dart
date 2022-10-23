import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> setupWorldTime() async {
    WorldTime worldTime = WorldTime(
        location: "Berlin", flag: "germany.png", url: "Europe/Berlin");

    await worldTime.getTime();

    if (!mounted) {
      return;
    }

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "location": worldTime.location,
      "flag": worldTime.flag,
      "time": worldTime.time,
      "isDayTime": worldTime.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
