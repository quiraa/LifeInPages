import 'package:flutter/material.dart';
import 'package:life_in_pages/pages/login/login_page.dart';

class RegisterMobile extends StatelessWidget {
  const RegisterMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const FlutterLogo(size: 120),
            const SizedBox(height: 32.0),
            const Text('Register',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700)),
            const SizedBox(height: 16.0),
            const TextField(
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person)),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16.0,
            ),
            const TextField(
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email)),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16.0,
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility_off)),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      )),
                  child: const Text(
                    'Create Account',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                )),
              ],
            ),
            const SizedBox(height: 16.0),
            TextButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage())),
                child: const Text("Already have an account?, Login")),
          ],
        ),
      ),
    );
  }
}
