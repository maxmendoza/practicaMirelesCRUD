import 'package:flutter/material.dart';
import 'package:learning/moduls/auth/screens/create_account.dart';
import 'package:learning/moduls/auth/screens/login.dart';
import 'package:learning/moduls/map/map_sample.dart';
import 'package:learning/moduls/tutorial/screens/tutorial.dart';
import 'package:learning/navigation/details.dart';
import 'package:learning/navigation/home.dart';
import 'package:learning/navigation/navigation.dart';
import 'package:learning/navigation/profile.dart';
import 'package:learning/navigation/reservaciones.dart';
import 'package:learning/navigation/top.dart';
import 'package:learning/widgets/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
//flutter pub get
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const Login(),
        '/register': (context) => const CreateAccount(),
        '/menu': (context) => const Navigation(),
        '/home': (context) => const Home(),
        '/top': (context) => const Top(),
        '/reservaciones': (context) => const Reservaciones(),
        '/profile': (context) => const Profile(),
        '/mapa': (context) => MapSample(),
        '/tutorial': (context) => Tutorial(),
      },
    );
  }
}
