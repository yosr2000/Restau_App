import 'package:cafe_restaut/pages/CoffeeScreen.page.dart';
import 'package:cafe_restaut/pages/authentification.page.dart';
import 'package:cafe_restaut/pages/crepeScreen.page.dart';
import 'package:cafe_restaut/pages/home.page.dart';
import 'package:cafe_restaut/pages/inscription.page.dart';
import 'package:cafe_restaut/pages/onBording.page.dart';
import 'package:cafe_restaut/pages/petitDej.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
Future<void>main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  final routes = {
    '/home': (context) => HomePage(),
    '/inscription': (context) => InscriptionPage(),
    '/authentification': (context) => AuthentificationPage(),
    '/coffee': (context) => CoffeePage(),
    '/petitDej': (context) => PetitDejPage(),
    '/crepe': (context) => CrepePage(),

  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading screen while checking the authentication state
            return CircularProgressIndicator();
          } else if (snapshot.hasData) {
            // User is authenticated, navigate to the home screen
            return HomePage();
          } else {
            // User is not authenticated, navigate to the onboarding screen
            return OnboardingScreen();
          }
        },
      ),
    );
  }
}
