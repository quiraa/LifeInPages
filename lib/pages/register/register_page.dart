import 'package:flutter/material.dart';
import 'package:life_in_pages/pages/register/register_mobile.dart';
import 'package:life_in_pages/pages/register/register_web.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = "/books_register";
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 620) {
        return const RegisterMobile();
      } else {
        return const RegisterWeb();
      }
    });
  }
}
