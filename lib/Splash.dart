import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  bool loading = false;
  int _start = 7;
  late Timer splashTimer;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    splashTimer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    const Main()));
          });
          timer.cancel();
        } else if (_start == 5) {
          setState(() {
            loading = true;
            _start--;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    startTimer();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
                children: <Widget>[
                  Image.asset('assets/images/matadorbet_logo.png',
                      width: 300, height: 200
                  ),
                ]),
            Visibility(
                visible: loading,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Image.asset('assets/images/loading.webp',
                          width: 150, height: 150),
                    ]
                )),
          ],
        ),
      ),
    );
  }
}