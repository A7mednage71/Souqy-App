import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:my_store/core/common/widgets/cusotm_back_arrow_app_bar.dart';

class BuildDeveloperWebView extends StatefulWidget {
  const BuildDeveloperWebView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BuildDeveloperWebViewState createState() => _BuildDeveloperWebViewState();
}

class _BuildDeveloperWebViewState extends State<BuildDeveloperWebView> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustombackArrowAppbar(),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri('https://github.com/A7mednage71'),
        ),
        onWebViewCreated: (InAppWebViewController controller) {
          _webViewController = controller;
        },
      ),
    );
  }
}
