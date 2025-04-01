import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:het/src/core/router/app_routes.dart';
import 'package:het/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:toastification/toastification.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OneIdPage extends StatefulWidget {
  const OneIdPage({super.key});

  @override
  State<OneIdPage> createState() => _OneIdPageState();
}

class _OneIdPageState extends State<OneIdPage> {
  late final bloc = context.read<AuthBloc>();

  late final WebViewController _webViewController;

  @override
  void initState() {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {

          },
          onNavigationRequest: (NavigationRequest request) {
            String url = request.url;
            debugPrint(url);
            if (url.contains("https://evis.het.uz/auth?code=")) {
              int index1 = url.indexOf("code=");
              int index2 = url.indexOf("&state");
              String code = url.substring(index1 + 5, index2);
              debugPrint('code: $code');
              bloc.oneId(code);
            } else {
              // _webViewController.loadRequest(Uri.dataFromString(url));
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          "https://evis.het.uz/api/accounts/one-id-login-redirect",
        ),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isLoginVerified) {
            _webViewController.clearCache();
            _webViewController.clearLocalStorage();
           //context.goNamed(AppRoutes.main.name);
          }
          if(state.hasError){
            toastification.show(
                title: Text(
                  state.errorMessage,
                  style: const TextStyle(fontSize: 16),
                ),
                type: ToastificationType.error,
                alignment: Alignment.bottomCenter,
                style: ToastificationStyle.fillColored,
                primaryColor: Colors.red);
          }
        },
        builder: (context, state) {
          return WebViewWidget(
            controller: _webViewController,
          );
        },
      ),
    );
  }
}
