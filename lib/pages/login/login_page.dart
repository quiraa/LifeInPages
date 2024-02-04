import 'package:flutter/material.dart';
import 'package:life_in_pages/pages/login/login_mobile.dart';
import 'package:life_in_pages/pages/login/login_web.dart';

class LoginPage extends StatelessWidget {
  static const routeName = "/books_login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 620) {
            return const LoginMobile();
          } else {
            return const LoginWeb();
          }
        },
      ),
    );
  }
}
