# AfriParliWatch Mobile Application - CodeNameKylo

## Overview

AfriParliWatch is a Flutter-based mobile application that provides a native mobile interface to the AfriParliWatch parliamentary monitoring platform. The app serves as a WebView wrapper around `app.afriparliwatch.com`, offering users a seamless mobile experience with integrated push notifications and native navigation.

## System Architecture

### Technology Stack
- **Framework**: Flutter 3.6.2+
- **Language**: Dart
- **Platform Support**: iOS, Android, Web, Desktop (Windows, macOS, Linux)
- **WebView Engine**: `webview_flutter` v4.7.0
- **Push Notifications**: OneSignal v5.1.0
- **UI Components**: Material Design 3 with custom branding

### Project Structure
```
afri_parli_watch/
├── lib/
│   ├── main.dart                 # Application entry point
│   ├── screens/
│   │   ├── splash_screen.dart    # Loading screen with animations
│   │   └── home_screen.dart      # Main WebView interface
│   └── services/
│       └── notification_service.dart  # OneSignal integration
├── assets/
│   └── images/
│       └── apw-logo.png         # Application logo
├── android/                      # Android-specific configuration
├── ios/                         # iOS-specific configuration
├── web/                         # Web platform configuration
├── windows/                     # Windows desktop configuration
├── macos/                       # macOS desktop configuration
└── linux/                       # Linux desktop configuration
```

## Features

### Core Functionality
1. **WebView Integration**: Seamless integration with `app.afriparliwatch.com`
2. **Push Notifications**: Real-time notifications via OneSignal
3. **Native Navigation**: Bottom navigation bar with key sections
4. **Pull-to-Refresh**: Swipe down to refresh content
5. **Loading Indicators**: Visual feedback during page loads
6. **Session Persistence**: Maintains login sessions across app restarts
7. **Haptic Feedback**: Tactile response for navigation interactions

### Navigation Sections
- **Home** (`/`): Main dashboard
- **Latest News** (`/category/latest-news/`): News feed
- **Notifications** (`/members/me/notifications/`): User notifications
- **Profile** (`/members/me/`): User profile and settings

### Design System
- **Primary Color**: #022147 (Company Blue)
- **Accent Color**: #DEB668 (Gold)
- **Status Bar**: White background with dark icons
- **Navigation**: Custom bottom bar with rounded corners and shadows

## Prerequisites

### Development Environment
- Flutter SDK 3.6.2 or higher
- Dart SDK 3.6.2 or higher
- Android Studio / VS Code with Flutter extensions
- Xcode (for iOS development)
- Git

### Platform-Specific Requirements
- **Android**: Android SDK, minimum API level 21
- **iOS**: Xcode 14+, iOS 12.0+
- **Web**: Modern web browser
- **Desktop**: Platform-specific build tools

## Installation & Setup

### 1. Clone the Repository
```bash
git clone <repository-url>
cd afri_parli_watch
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Configure OneSignal (Push Notifications)

#### Current Configuration
The app is currently configured with OneSignal App ID: `35062a69-37b9-4f8c-ba32-b07e7ed7ba57`

#### To Update OneSignal Configuration:
1. Sign up for a OneSignal account at [onesignal.com](https://onesignal.com)
2. Create a new app in the OneSignal dashboard
3. Update the App ID in `lib/services/notification_service.dart`:
   ```dart
   OneSignal.initialize("YOUR_NEW_ONESIGNAL_APP_ID");
   ```

### 4. Platform-Specific Setup

#### Android Configuration
1. **Application ID**: Verify in `android/app/build.gradle`
   ```gradle
   applicationId "com.example.afri_parli_watch"
   ```
2. **Minimum SDK**: API level 21 (Android 5.0)
3. **Target SDK**: Latest stable version
4. **Permissions**: Internet access is automatically included

#### iOS Configuration
1. **Bundle Identifier**: Update in Xcode project settings
2. **Push Notifications**: Enable in Capabilities tab
3. **Provisioning Profile**: Configure for your team
4. **Minimum iOS Version**: 12.0

#### Web Configuration
- No additional configuration required
- Builds automatically for modern browsers

#### Desktop Configuration
- **Windows**: Requires Visual Studio Build Tools
- **macOS**: Requires Xcode Command Line Tools
- **Linux**: Requires standard development packages

## Running the Application

### Development Mode
```bash
# Run on connected device/emulator
flutter run

# Run on specific platform
flutter run -d chrome    # Web
flutter run -d windows   # Windows
flutter run -d macos     # macOS
flutter run -d linux     # Linux
```

### Debug Mode
```bash
flutter run --debug
```

### Profile Mode (Performance Testing)
```bash
flutter run --profile
```

### Release Mode
```bash
flutter run --release
```

## Building for Production

### Android APK
```bash
# Generate APK
flutter build apk --release

# Generate split APKs for different architectures
flutter build apk --split-per-abi --release
```

### Android App Bundle (Recommended for Play Store)
```bash
flutter build appbundle --release
```

### iOS
```bash
# Build for iOS
flutter build ios --release

# Archive for App Store (requires Xcode)
# Open ios/Runner.xcworkspace in Xcode
# Product > Archive
```

### Web
```bash
flutter build web --release
```

### Desktop
```bash
# Windows
flutter build windows --release

# macOS
flutter build macos --release

# Linux
flutter build linux --release
```

## Dependencies

### Core Dependencies
- **webview_flutter**: ^4.7.0 - WebView functionality
- **onesignal_flutter**: ^5.1.0 - Push notifications
- **flutter_spinkit**: ^5.2.0 - Loading animations
- **font_awesome_flutter**: ^10.7.0 - Icon library

### Development Dependencies
- **flutter_test**: Flutter testing framework
- **flutter_lints**: ^5.0.0 - Code linting rules

## Configuration Files

### Key Configuration Files
- `pubspec.yaml`: Dependencies and project metadata
- `analysis_options.yaml`: Dart analysis rules
- `android/app/build.gradle`: Android build configuration
- `ios/Runner/Info.plist`: iOS app configuration
- `web/index.html`: Web platform entry point

## Testing

### Unit Tests
```bash
flutter test
```

### Integration Tests
```bash
flutter test integration_test/
```

### Manual Testing Checklist
- [ ] App launches and shows splash screen
- [ ] WebView loads main site correctly
- [ ] Navigation between sections works
- [ ] Pull-to-refresh functionality
- [ ] Push notifications (if configured)
- [ ] Haptic feedback on navigation
- [ ] Loading indicators display properly

## Deployment

### Google Play Store (Android)
1. Build app bundle: `flutter build appbundle --release`
2. Upload to Google Play Console
3. Configure store listing and release

### Apple App Store (iOS)
1. Build in Xcode: `flutter build ios --release`
2. Archive and upload via Xcode
3. Configure App Store Connect listing

### Web Deployment
1. Build web version: `flutter build web --release`
2. Deploy `build/web/` directory to web server
3. Configure server for single-page application routing

### Desktop Distribution
- **Windows**: Create installer from `build/windows/runner/Release/`
- **macOS**: Create DMG from `build/macos/Build/Products/Release/`
- **Linux**: Create AppImage or package from `build/linux/x64/release/bundle/`

## Maintenance & Updates

### Updating Dependencies
```bash
# Check for outdated packages
flutter pub outdated

# Update dependencies
flutter pub upgrade

# Update to latest versions (may break compatibility)
flutter pub upgrade --major-versions
```

### Flutter Version Management
```bash
# Check current Flutter version
flutter --version

# Upgrade Flutter
flutter upgrade
```

### Platform-Specific Updates
- **Android**: Update Gradle and build tools as needed
- **iOS**: Update Xcode and deployment targets
- **Web**: Update web renderer and browser compatibility

## Troubleshooting

### Common Issues

#### Build Failures
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter run
```

#### WebView Issues
- Ensure target website is accessible
- Check JavaScript execution permissions
- Verify SSL certificate validity

#### Push Notification Issues
- Verify OneSignal App ID is correct
- Check device permissions
- Ensure proper provisioning profiles (iOS)

#### Platform-Specific Issues
- **Android**: Check SDK versions and permissions
- **iOS**: Verify signing certificates and provisioning
- **Web**: Check browser compatibility and CORS policies

### Debug Mode
```bash
# Enable verbose logging
flutter run --verbose

# Check device connectivity
flutter devices
```

## Security Considerations

### WebView Security
- JavaScript execution is enabled for full functionality
- SSL/TLS encryption for all web communications
- No local file access permissions

### Push Notifications
- OneSignal handles secure token management
- No sensitive data stored locally
- User consent required for notifications

### Data Privacy
- No user data stored locally beyond session cookies
- All data processing occurs on the web platform
- Compliant with standard mobile app privacy practices

## Performance Optimization

### WebView Performance
- Optimized loading indicators
- Efficient navigation handling
- Minimal memory footprint

### App Performance
- Lazy loading of components
- Efficient state management
- Optimized animations and transitions

## Support & Documentation

### Development Team Contact
For technical support and development questions, contact the development team.

### Additional Resources
- [Flutter Documentation](https://flutter.dev/docs)
- [OneSignal Documentation](https://documentation.onesignal.com)
- [WebView Flutter Documentation](https://pub.dev/packages/webview_flutter)

### Version History
- **v0.1.0**: Initial release with core WebView functionality and push notifications

---

**Note**: This application is designed as a WebView wrapper and relies on the web platform at `app.afriparliwatch.com` for all core functionality. The mobile app provides native mobile experience and push notification capabilities while maintaining full compatibility with the web platform.
