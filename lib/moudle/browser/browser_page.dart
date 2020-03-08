import 'package:flutter/material.dart';
import 'package:wan_android/common/route/route.dart';
import 'package:wan_android/moudle/browser/browser_bottom_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserPage extends StatefulWidget {
  String _url = 'https://www.baidu.com';
  String _title = '';

  @override
  _BrowserPageState createState() => _BrowserPageState();

  BrowserPage(this._url, this._title);
}

class _BrowserPageState extends State<BrowserPage> {
  WebViewController _webViewController;
  final webViewKey = GlobalKey();
  final bottomBarKey = GlobalKey<BrowserBottomBarState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Builder(builder: (BuildContext context) {
          return WebView(
            key: webViewKey,
            initialUrl: this.widget._url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _webViewController = webViewController;
              _webViewController.currentUrl().then((url) {
                bottomBarKey.currentState.setUrl(url);
              });
            },
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                print('blocking navigation to $request}');
                return NavigationDecision.prevent;
              }
              print('allowing navigation to $request');
              return NavigationDecision.navigate;
            },
            onPageStarted: (String url) {
              print('Page started loading: $url');
              bottomBarKey.currentState.setUrl(url);
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
              _webViewController.getTitle().then((res) {
                bottomBarKey.currentState.setTitle(res);
              });
              bottomBarKey.currentState.setUrl(url);
            },
            gestureNavigationEnabled: true,
          );
        }),
      ),
      bottomNavigationBar: BrowserBottomBar(
        key: bottomBarKey,
        backCallback: () async {
          final res = await _webViewController.canGoBack();
          if (res) {
            _webViewController.goBack();
          } else {
            RouteCenter.instance.pop(context);
          }
        },
        moreCallback: () {},
      ),
    );
  }
}
