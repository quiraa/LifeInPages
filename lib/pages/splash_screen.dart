import 'package:flutter/material.dart';
import 'package:life_in_pages/pages/login/login_page.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/books_splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 100,
            ),
            Text('LifeInPages',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.0))
          ],
        ),
      ),
    );
  }
}
