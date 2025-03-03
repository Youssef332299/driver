import 'package:driver/screens/auth/widgets/login/view.dart';
import 'package:driver/screens/auth/widgets/signup/widgets/complete_profile/view.dart';
import 'package:driver/screens/auth/widgets/signup/widgets/set_password/view.dart';
import 'package:driver/screens/navigation_bar/navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:driver/screens/auth/widgets/signup/widgets/otp/view.dart';
import 'package:driver/screens/splash/view.dart';
import 'core/language/generated/l10n.dart';
import 'data/firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        locale: const Locale('en'),
        supportedLocales: S.delegate.supportedLocales,
      home: const NavigationBarPage(),
      // home: const SplashPage(),
    );
  }
}


// web       1:919686196437:web:04a3e458d6f525e6cb865c
// android   1:919686196437:android:f7ed468ff4d6f0bbcb865c
// ios       1:919686196437:ios:a0a0dd331d01577bcb865c
// macos     1:919686196437:ios:a0a0dd331d01577bcb865c
// windows   1:919686196437:web:1056553ab33859b5cb865c
// MD5: 71:DE:5A:70:77:F4:30:5E:B3:29:0C:9A:15:2B:1D:B0
// SHA1: 9D:F3:9F:2A:93:87:F6:A8:EF:4B:E6:01:3F:93:14:FC:AF:82:65:48
// SHA-256: 3E:46:C8:DE:94:2C:C7:53:88:F6:11:47:17:48:3D:48:8C:CB:0F:74:FD:45:CF:34:E4:76:9B:2F:D2:D0:7E:F4
