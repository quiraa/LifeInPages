import 'package:flutter/material.dart';
import 'package:life_in_pages/model/books.dart';
import 'package:life_in_pages/pages/detail/detail_page.dart';
import 'package:life_in_pages/pages/home/home_page.dart';
import 'package:life_in_pages/pages/login/login_page.dart';
import 'package:life_in_pages/pages/register/register_page.dart';
import 'package:life_in_pages/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifeInPages',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        LoginPage.routeName: (context) => const LoginPage(),
        RegisterPage.routeName: (context) => const RegisterPage(),
        HomePage.routeName: (context) => const HomePage(),
        DetailPage.routeName: (context) => DetailPage(
            book: ModalRoute.of(context)?.settings.arguments as Books)
      },
    );
  }
}
