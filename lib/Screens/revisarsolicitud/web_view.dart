import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewpage extends StatelessWidget {
  final String title;
  final String url;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  WebViewpage({required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: WebView(
          initialUrl: url,
        ));
  }
}
