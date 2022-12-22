import 'package:best_book_seller/Globals/colors.dart';
import 'package:best_book_seller/Providers/auth_Provider.dart';
import 'package:best_book_seller/Screens/login_screen.dart';
import 'package:best_book_seller/Screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/home_screen.dart';
import 'Screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => AuthProvider())),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: splashBlackColor,
              textSelectionTheme: const TextSelectionThemeData(
                  selectionColor: yellowcolor, cursorColor: yellowcolor)),
          home: const Splash(),
          //this is routes

          routes: {
            '/login': (ctx) => const LoginScreen(),
            '/register': (ctx) => const RegisterScreen(),
            '/home': (ctx) => const HomeScreen(),
          }),
    );
  }
}
