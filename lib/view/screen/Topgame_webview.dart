// ignore_for_file: file_names
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/widgets.dart';

class TopgameWebView extends StatefulWidget {
  final weblink;
  const TopgameWebView({Key? key, this.weblink}) : super(key: key);

  @override
  State<TopgameWebView> createState() => _TopgameWebViewState();
}
    final _key = UniqueKey();

class _TopgameWebViewState extends State<TopgameWebView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: widget.weblink)
    );
  }
}
