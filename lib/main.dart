import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

const floworaUrl = 'https://geminimodel-git.github.io/FlowOra2.0/';
const bg = Color(0xFF0F0C1B);
const accent = Color(0xFFFF6B9D);

void main() => runApp(const FloworaApp());

class FloworaApp extends StatelessWidget {
  const FloworaApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'FLOWORA 2.0',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: bg,
          colorScheme: const ColorScheme.dark(
            primary: accent,
            secondary: Color(0xFFE3B85D),
            surface: bg,
          ),
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: accent),
        ),
        home: const FloworaWebView(),
      );
}

class FloworaWebView extends StatefulWidget {
  const FloworaWebView({super.key});

  @override
  State<FloworaWebView> createState() => _FloworaWebViewState();
}

class _FloworaWebViewState extends State<FloworaWebView> {
  late final WebViewController _controller;
  bool _loading = true;
  bool _failed = false;
  int _progress = 0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(bg)
      ..enableZoom(false)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {
          if (mounted) setState(() => _progress = progress);
        },
        onPageStarted: (_) {
          if (mounted) setState(() {
            _loading = true;
            _failed = false;
          });
        },
        onPageFinished: (_) {
          if (mounted) setState(() {
            _loading = false;
            _failed = false;
          });
        },
        onWebResourceError: (error) {
          if (error.isForMainFrame == true && mounted) {
            setState(() {
              _loading = false;
              _failed = true;
            });
          }
        },
      ))
      ..loadRequest(Uri.parse(floworaUrl));
  }

  Future<void> _handleBack() async {
    if (await _controller.canGoBack()) {
      await _controller.goBack();
    } else {
      await SystemNavigator.pop();
    }
  }

  @override
  Widget build(BuildContext context) => PopScope<Object?>(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) _handleBack();
        },
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                WebViewWidget(controller: _controller),
                if (_loading)
                  Positioned.fill(
                    child: ColoredBox(
                      color: bg,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.spa_rounded,
                                color: accent, size: 54),
                            const SizedBox(height: 18),
                            const Text(
                              'FLOWORA 2.0',
                              style: TextStyle(
                                color: accent,
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 3,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Health care with Gynecologist Manahil Saqlain',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white70, fontSize: 11),
                            ),
                            const SizedBox(height: 24),
                            const SizedBox(
                              width: 170,
                              child: LinearProgressIndicator(
                                minHeight: 3,
                                backgroundColor: Color(0xFF34243B),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text('Loading $_progress%',
                                style: const TextStyle(
                                    color: Colors.white54, fontSize: 11)),
                            const SizedBox(height: 22),
                            const Text('Dev by minn_saqii',
                                style: TextStyle(
                                    color: Color(0xFFE3B85D),
                                    letterSpacing: 1.2,
                                    fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (_failed && !_loading)
                  Positioned.fill(
                    child: ColoredBox(
                      color: bg,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(28),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.wifi_off_rounded,
                                  color: accent, size: 42),
                              const SizedBox(height: 12),
                              const Text('Unable to load FLOWORA',
                                  style: TextStyle(fontSize: 18)),
                              const SizedBox(height: 8),
                              const Text(
                                'Check your internet connection and try again.',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white70),
                              ),
                              const SizedBox(height: 18),
                              FilledButton(
                                onPressed: () => _controller.loadRequest(
                                    Uri.parse(floworaUrl)),
                                child: const Text('Try again'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
}
