import 'package:flutter/material.dart';
import 'Splash.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("0eeacf7a-ca91-4ba7-b01f-10f20c60c902");
  OneSignal.Notifications.requestPermission(true);

  runApp(const MatadorBet());
}

class MatadorBet extends StatelessWidget {
  const MatadorBet({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}