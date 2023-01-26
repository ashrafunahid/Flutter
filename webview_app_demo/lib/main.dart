import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Permission.camera.request();
  // await Permission.microphone.request();
  // await Permission.storage.request();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

    var swAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
    var swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

    if (swAvailable && swInterceptAvailable) {
      AndroidServiceWorkerController serviceWorkerController =
      AndroidServiceWorkerController.instance();

      serviceWorkerController.serviceWorkerClient = AndroidServiceWorkerClient(
        shouldInterceptRequest: (request) async {
          print(request);
          return null;
        },
      );
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web View App Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebViewApp(),
    );
  }
}

class WebViewApp extends StatefulWidget {

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {

  var initialUrl = "https://www.google.com/";
  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        supportZoom: false,
        clearCache: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));
  PullToRefreshController? refreshController;
  double progress = 0.0;
  bool isLoading = false;
  bool hasConnection = false;
  checkInternetConnection() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if(this.mounted){
      setState(() {
        hasConnection = result;
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkInternetConnection();
    refreshController = PullToRefreshController(
      onRefresh: (){
        webViewController!.reload();
      },
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return hasConnection == true
        ? Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          InAppWebView(
            onWebViewCreated: (controller) => webViewController = controller,
            initialUrlRequest: URLRequest(url: Uri.parse(initialUrl)),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                supportZoom: false,
                clearCache: true,
              ),
              android: AndroidInAppWebViewOptions(
                useHybridComposition: true,
              )
            ),
            pullToRefreshController: refreshController,
            onProgressChanged: (controller, progress){
              if(progress == 100){
                refreshController!.endRefreshing();
              }
              setState(() {
                this.progress = progress / 100;
              });
            },
            onLoadStart: (controller, url){
              setState(() {
                isLoading = true;
              });
            },
            onLoadStop: (controller, url) {
              refreshController!.endRefreshing();
              setState(() {
                isLoading = false;
              });
            },
          ),
          Visibility(
            visible: isLoading,
              child: Image.asset('assets/images/loader1.gif', width: 200,)
          ),
        ],
      ),
    )
        : Scaffold(
      body: Center(
        child: Text("No Internet Connection"),
      ),
    );
  }
}

