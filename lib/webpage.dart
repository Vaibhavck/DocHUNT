import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  final url;
  final name;
  WebPage(this.url, this.name);
  @override
  _WebPageState createState() => _WebPageState(this.url, this.name);
}

class _WebPageState extends State<WebPage> {
  var webURL = '';
  var name = '';
  _WebPageState(url, name){
    this.webURL = url;
    this.name = name;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(this.name),
      ),

      body: WebView(
        initialUrl: webURL,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}