import 'package:flutter/material.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/gradient_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomerSupportScreen extends StatefulWidget {
  const CustomerSupportScreen({super.key});

  @override
  State<CustomerSupportScreen> createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
  late WebViewController _webViewController;
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Чат с техподдержкой"),
            flexibleSpace: const GradientAppBar()),
        body: Stack(
          children: [
            WebView(
              initialUrl: 'https://skynet.bitrix24site.ru',
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (String url) {
                _hideFooterAndSimulateClick();
                setState(() {
                  _isLoading = false;
                });
              },
              onWebViewCreated: (WebViewController controller) {
                _webViewController = controller;
              },
            ),
            if (_isLoading)
             const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ));
  }

  void _hideFooterAndSimulateClick() async {
    const String hideAndClickJS = '''
    (function() {
      // Hide the footer element
      var footerElements = document.getElementsByClassName('bitrix-footer');
      if (footerElements.length > 0) {
        footerElements[0].style.display = 'none';
      }

      // Simulate click on the specified element
      var clickTarget = document.querySelector('[data-b24-crm-button-icon="openline"]');
      if (clickTarget) {
        clickTarget.click();
      }
    })();
  ''';

    try {
      await _webViewController.runJavascript(hideAndClickJS);
    } catch (e) {
      print("Error while executing JavaScript: $e");
    }
  }
}
