import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  static WebViewController? _webViewController;

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();

  static void setWebViewController(WebViewController controller) {
    _webViewController = controller;
  }

  static Future<void> initialize() async {
    // Enable debug logs for development
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    // Initialize OneSignal (remove await as it returns void)
    OneSignal.initialize("35062a69-37b9-4f8c-ba32-b07e7ed7ba57");

    // Request permission (remove await as it returns void)
    OneSignal.Notifications.requestPermission(true);

    // Handle notification opened handler
    OneSignal.Notifications.addClickListener((event) {
      if (event.notification.additionalData != null &&
          event.notification.additionalData!['post_url'] != null) {
        final postUrl =
            event.notification.additionalData!['post_url'] as String;
        // Load the URL in WebView when notification is clicked
        _webViewController?.loadRequest(Uri.parse(postUrl));
      }
    });
  }
}
