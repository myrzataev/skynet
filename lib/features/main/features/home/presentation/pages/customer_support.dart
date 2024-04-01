import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:skynet/features/main/features/home/presentation/widgets/gradient_appbar.dart';

class CustomerSupportScreen extends StatefulWidget {
  const CustomerSupportScreen({super.key});

  @override
  State<CustomerSupportScreen> createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
  // final controller = WebViewController()
  //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //   ..loadRequest(Uri.parse("https://skynet.bitrix24site.ru"));
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
      body: InAppWebView(
        initialUrlRequest:
            URLRequest(url: Uri.parse("https://skynet.bitrix24site.ru")),
        onWebViewCreated: (InAppWebViewController controller) {
        },
      ),
    );
  }
}
