import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'authentication/home/home_provider.dart';
import 'authentication/Fees/fees_provider.dart';
import 'authentication/HomeWorks/homeworks_provider.dart';
import 'authentication/classtimetable/classtimetable_provider.dart';
import 'authentication/noticeboard/noticeboard_provider.dart';
import 'authentication/overallresult/overallresult_provider.dart';
import 'authentication/LiveClasses/live_provider.dart';
import 'authentication/attandence/attendence_provider.dart';
import 'authentication/event/event_provider.dart';
import 'authentication/leaverequest/leaverequest_provider.dart';
import 'authentication/provider/LOGIN/login_provider.dart';
import 'authentication/studymaterial/studymaterial_provider.dart';
import 'login/login_screen.dart';
import 'navigation_menu/navigation_menu.dart';
Future<void> setupFCM() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // ✅ Ask permission (VERY IMPORTANT)
  NotificationSettings settings = await messaging.requestPermission();

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    String? token = await messaging.getToken();
    print("🔥 FCM TOKEN: $token");
  } else {
    print("❌ Notification permission denied");
  }

  // ✅ Token refresh listener
  FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
    print("🔄 NEW TOKEN: $newToken");
  });
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupFCM(); // 👈 ADD THIS LINE

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Function to check if user is logged in
  Future<bool> _isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token'); // replace 'token' with your key
    return token != null && token.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => LiveProvider()),
        ChangeNotifierProvider(create: (_) => HomeworksProvider()),
        ChangeNotifierProvider(create: (_) => FeesProvider()),
        ChangeNotifierProvider(create: (_) => NoticeboardProvider()),
        ChangeNotifierProvider(create: (_) => ClasstimetableProvider()),
        ChangeNotifierProvider(create: (_) => OverallresultProvider()),
        ChangeNotifierProvider(create: (_) => AttendenceProvider()),
        ChangeNotifierProvider(create: (_) => LeaveRequestProvider()),
        ChangeNotifierProvider(create: (_) => StudymaterialProvider()),
        ChangeNotifierProvider(create: (_) => EventProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.loraTextTheme(Theme.of(context).textTheme),
        ),
        home: FutureBuilder<bool>(
          future: _isUserLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show splash/loading while checking login status
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            } else {
              if (snapshot.data == true) {
                // User is logged in, go to Dashboard
                return  NavigationMenu();
              } else {
                // Not logged in, go to Login
                return LoginScreen();
              }
            }
          },
        ),
      ),
    );
  }
}