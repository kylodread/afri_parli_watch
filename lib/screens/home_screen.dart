import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../services/notification_service.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final WebViewController _controller;
  bool isLoading = true;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _initWebView();
  }

  void _initWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse('https://app.afriparliwatch.com'));

    // Register the WebViewController with NotificationService
    NotificationService.setWebViewController(_controller);
  }

  void _onItemTapped(int index) async {
    // Add haptic feedback
    await HapticFeedback.selectionClick();

    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        _controller.loadRequest(Uri.parse('https://app.afriparliwatch.com'));
        break;
      case 1:
        _controller.loadRequest(
            Uri.parse('https://app.afriparliwatch.com/category/latest-news/'));
        break;
      case 2:
        _controller.loadRequest(Uri.parse(
            'https://app.afriparliwatch.com/members/me/notifications/'));
        break;
      case 3:
        _controller.loadRequest(
            Uri.parse('https://app.afriparliwatch.com/members/me/'));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            RefreshIndicator(
              color: const Color(0xFF022147), // Company blue
              onRefresh: () async {
                await _controller.reload();
              },
              child: WebViewWidget(controller: _controller),
            ),
            if (isLoading)
              const Center(
                child: SpinKitCircle(
                  color: Color(0xFF022147),
                  size: 50.0,
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF022147),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, FontAwesomeIcons.house),
              _buildNavItem(1, FontAwesomeIcons.newspaper),
              _buildNavItem(2, FontAwesomeIcons.bell),
              _buildNavItem(3, FontAwesomeIcons.user),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: FaIcon(
          icon,
          color: isSelected ? const Color(0xFFDEB668) : Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
