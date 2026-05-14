# 📚 School Management System

A comprehensive Flutter-based school management application designed for students, providing real-time access to academic and administrative information through a mobile platform.

## 🎯 Project Overview

This is a full-featured school management system built with **Flutter** that enables students to manage their academic life efficiently. The app integrates with Firebase for real-time notifications and uses various state management solutions for robust data handling.

### ✨ Key Features

- **🔐 User Authentication**: Secure login system with token-based authentication
- **📊 Dashboard**: Personalized dashboard with quick access to all features
- **📝 Homework Management**: View and track assigned homework
- **📚 Study Materials**: Access study resources and educational content
- **⏰ Class Timetable**: View class schedule and exam timetable
- **📋 Attendance Tracking**: Monitor attendance records
- **💰 Fee Management**: View fee details and payment status
- **🎓 Results & Performance**: Overall results and academic performance tracking
- **📢 Notice Board**: Stay updated with school announcements
- **🎥 Live Classes**: Access live class sessions
- **📅 Leave Requests**: Submit and track leave requests
- **🎉 Events**: View school events and activities
- **👤 User Profile**: Manage user profile and personal information
- **🔔 Push Notifications**: Real-time notifications via Firebase Cloud Messaging

## 🛠️ Technology Stack

### Frontend
- **Flutter**: Cross-platform mobile framework
- **Dart**: Programming language
- **Provider**: State management solution
- **GetX**: Navigation and routing

### Backend Integration
- **Firebase**: 
  - Cloud Messaging (FCM) for push notifications
  - Authentication services
- **Dio**: HTTP client for API requests
- **HTTP**: Additional HTTP communication

### UI & Utilities
- **Google Fonts**: Typography management
- **Iconsx**: Icon library
- **Cupertino Icons**: iOS-style icons
- **WebView Flutter**: In-app web browsing
- **Razorpay**: Payment gateway integration

### Data Management
- **SharedPreferences**: Local data persistence
- **Intl**: Internationalization support

### Additional
- **Flutter Local Notifications**: Local notification handling
- **Toast Messages**: User feedback notifications
- **URL Launcher**: Launch external URLs

## 📱 Project Structure

```
lib/
├── main.dart                          # Application entry point
├── authentication/
│   ├── home/                          # Home/Dashboard section
│   ├── Fees/                          # Fee management
│   ├── HomeWorks/                     # Homework management
│   ├── classtimetable/                # Class timetable
│   ├── noticeboard/                   # Notice board
│   ├── overallresult/                 # Results section
│   ├── LiveClasses/                   # Live class integration
│   ├── attandence/                    # Attendance tracking
│   ├── event/                         # Events section
│   ├── leaverequest/                  # Leave request system
│   ├── studymaterial/                 # Study materials
│   ├── models/                        # Data models
│   ├── provider/                      # State management providers
│   ├── api_routes/                    # API endpoint definitions
│   ├── shared_prefernces/             # SharedPreferences utilities
│   ├── pref_keys/                     # Preference key constants
│   └── loading_widget/                # Loading indicators
├── screen/                            # UI screens
│   ├── Homework/
│   ├── Live/
│   ├── admitcard/
│   ├── attendance/
│   ├── classtimetable/
│   ├── dashboard/
│   ├── event/
│   ├── examtimetable/
│   ├── fees/
│   ├── leaverequest/
│   ├── manu/
│   ├── noticebaord/
│   ├── overalllresult/
│   ├── profile/
│   └── studymaterial/
├── common_widgets/                    # Reusable widgets
├── constant/                          # App constants
├── login/                             # Login screen
└── navigation_menu/                   # Navigation structure

android/                               # Android platform code
ios/                                   # iOS platform code
web/                                   # Web platform code
linux/                                 # Linux platform code
macos/                                 # macOS platform code
windows/                               # Windows platform code
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.11.1 or higher)
- Dart SDK (included with Flutter)
- Android Studio / Xcode (for emulators)
- Firebase account and configuration

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/vishbairagi/school-management-system.git
   cd school-management-system
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Configure Firebase project in Firebase Console
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Place them in respective platform directories
   - The `firebase_options.dart` is already configured

4. **Run the app**
   ```bash
   flutter run
   ```

### Building for Production

**Android:**
```bash
flutter build apk --release
flutter build appbundle --release
```

**iOS:**
```bash
flutter build ios --release
```

## 📋 Dependencies

Key packages used in this project:

```yaml
- flutter: SDK framework
- get: 4.7.3 - Navigation and state management
- http: 1.6.0 - HTTP requests
- provider: 6.1.5+1 - State management
- shared_preferences: 2.5.4 - Local storage
- google_fonts: 8.0.2 - Google Fonts integration
- dio: 5.9.2 - Advanced HTTP client
- firebase_core: 4.5.0 - Firebase core
- firebase_messaging: 16.1.2 - Push notifications
- flutter_local_notifications: 21.0.0 - Local notifications
- razorpay_flutter: 1.4.1 - Payment processing
- webview_flutter: 4.13.1 - WebView embedding
- intl: 0.20.2 - Internationalization
- iconsx: 0.0.8 - Icon library
- url_launcher: 6.3.2 - URL launching
- fluttertoast: 9.0.0 - Toast messages
```

## 🔧 Configuration

### Firebase Cloud Messaging (FCM)

The app is configured with FCM for push notifications. The setup includes:

1. Token request and permission handling
2. Token refresh listener
3. Device-specific notification permissions

### Local Preferences

Application uses SharedPreferences for storing:
- User authentication token
- User session data
- App preferences

## 📲 Features Explanation

### Authentication
- Secure token-based login system
- Automatic session management
- Persistent login state

### Dashboard
- Quick stats overview
- Recent announcements
- Quick action buttons

### Homework & Study Materials
- View assigned homework
- Access study resources
- Download materials

### Attendance & Results
- Real-time attendance tracking
- Performance analytics
- Result declarations

### Fee Management
- Fee structure view
- Payment history
- Payment integration with Razorpay

### Communication
- Notice board announcements
- Leave request workflow
- Event calendar

## 🔐 Security Features

- Token-based authentication
- Secure local data storage
- Firebase security rules
- Encrypted API communication

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is currently unlicensed. Please contact the repository owner for licensing information.

## 👨‍💻 Author

**Vish Bairagi**
- GitHub: [@vishbairagi](https://github.com/vishbairagi)
- Repository: [school-management-system](https://github.com/vishbairagi/school-management-system)

## 📞 Support

For support, please open an issue in the GitHub repository.

## 🎓 Learning Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Dart Documentation](https://dart.dev/guides)
- [Provider Package Documentation](https://pub.dev/packages/provider)
- [GetX Documentation](https://pub.dev/packages/get)

## 📝 Changelog

### Version 1.0.0 (Current)
- Initial release
- Core features implementation
- Firebase integration
- Multi-platform support (Android, iOS, Web, Linux, macOS, Windows)

---

**Last Updated**: May 14, 2026  
**Status**: Active Development
