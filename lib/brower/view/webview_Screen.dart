import 'package:brower/brower/provider/webprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class WebView extends StatefulWidget {
  const WebView({Key? key}) : super(key: key);

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  TextEditingController txtserch = TextEditingController();
  InAppWebViewController? webViewController;
  PullToRefreshController? pullToRefreshController;

  webprovider? pF;
  webprovider? pT;


  @override
  void initState() {
    super.initState();
    pullToRefreshController =PullToRefreshController(onRefresh: () {
      webViewController!.reload();
    },);
  }

  @override
  Widget build(BuildContext context) {
    pF =Provider.of<webprovider>(context,listen: false);
    pT=Provider.of<webprovider>(context,listen: true);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: txtserch,
                decoration: InputDecoration(
                  border: InputBorder.none,
                    hintText: "Serch here",
                    helperStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.search_rounded),
                    suffix: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    webViewController!.loadUrl(
                        urlRequest: URLRequest(
                            url: Uri.parse(
                                "https://www.google.com/search?q=${txtserch.text}")));
                  },
                )),
              ),
            ),
            LinearProgressIndicator(
              value: pT!.i,
              backgroundColor: Colors.pink,
            ),
            Expanded(
              child: InAppWebView(
                initialUrlRequest:
                    URLRequest(url: Uri.parse("https://www.google.com/")),
                onLoadStart: (controller, url) {
                  webViewController = controller;
                },
                onLoadStop: (controller, url) {
                  webViewController = controller;
                },
                onLoadError: (controller, url, code, message) {
                  webViewController = controller;
                },
                onProgressChanged: (controller, progress) {
                  webViewController = controller;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => webViewController!.goBack(),
                  icon: Icon(Icons.arrow_back_rounded),
                  iconSize: 25,
                  color: Colors.black87,
                ),
                IconButton(
                  onPressed: () => webViewController!.reload(),
                  icon: Icon(Icons.refresh_rounded),
                  iconSize: 25,
                  color: Colors.black87,
                ),
                IconButton(
                  onPressed: () => webViewController!.goForward(),
                  icon: Icon(Icons.arrow_forward_rounded),
                  iconSize: 25,
                  color: Colors.black87,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
