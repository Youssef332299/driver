import 'package:driver/screens/navigation_bar/navigation_bar.dart';
import 'package:driver/screens/navigation_bar/widgets/home/cubit/home_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'core/language/generated/l10n.dart';
import 'data/firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [BlocProvider(create: (context) => HomeCubit()..init(context)),],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('en'),
          supportedLocales: S.delegate.supportedLocales,
          home: const NavigationBarPage(),
          // home: const SplashPage(),
        ));
  }
}

// SHA1: 9D:F3:9F:2A:93:87:F6:A8:EF:4B:E6:01:3F:93:14:FC:AF:82:65:48
// SHA-256: 3E:46:C8:DE:94:2C:C7:53:88:F6:11:47:17:48:3D:48:8C:CB:0F:74:FD:45:CF:34:E4:76:9B:2F:D2:D0:7E:F4
