import 'package:fireapp/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CallScreen(),
    );
  }
}

class CallScreen extends StatefulWidget {
  const CallScreen({Key key}) : super(key: key);

  @override
  _CallScreenState createState() => _CallScreenState();
}

final AgoraClient client = AgoraClient(
  agoraConnectionData: AgoraConnectionData(
    appId: APP_ID,
    channelName: "sufksjkj",
  ),
  enabledPermission: [
    Permission.camera,
    Permission.microphone,
  ],
);

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(client: client),
            AgoraVideoButtons(client: client),
          ],
        ),
      ),
    );
  }
}
