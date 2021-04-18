




import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

String selectedUrl = 'https://console.firebase.google.com/project/resturant-ddd20/notification';
final Set<JavascriptChannel> jsChannels = [
  JavascriptChannel(
      name: 'Print',
      onMessageReceived:
          (JavascriptMessage message) {
        print(message.message);
      }),
].toSet();


class Notify extends StatefulWidget {
  static const id = 'Notification';

  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebviewScaffold(
          clearCookies: false,
          clearCache: false,
          url: selectedUrl,

          javascriptChannels: jsChannels,
          mediaPlaybackRequiresUserGesture:
          true,
          withZoom: true,
          withLocalStorage: true,
          hidden: true,
          withJavascript: true,
          primary: true,
         // allowFileURLs: true,
          // withLocalUrl: true,
          scrollBar: false,
          appCacheEnabled: true,
          initialChild: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceEvenly,
                children: [
                  Image.asset(
                    'images/logo.png',
                    scale: .5,
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
