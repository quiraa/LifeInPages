import 'package:book_store/features/interface/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildDrawerHeader(context),
            _buildDrawerContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.28,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            minRadius: 56,
            foregroundImage: Image.asset('assets/images/avatar.jpg').image,
            backgroundImage: Image.asset('assets/images/avatar.jpg').image,
          ),
          const SizedBox(height: 16),
          const Text(
            'quiraa',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerContent(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, _) {
        return Column(
          children: [
            ListTile(
              title: const Text(
                'Profile',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {},
              leading: const Icon(Ionicons.person_circle_outline),
            ),
            ListTile(
              title: const Text(
                'Transaction',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {},
              leading: const Icon(Ionicons.cash_outline),
            ),
            ListTile(
              title: const Text(
                'Settings',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {},
              leading: const Icon(Ionicons.settings_outline),
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'Help Center',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {},
              leading: const Icon(Ionicons.help_outline),
            ),
            ListTile(
              title: const Text(
                'About The App',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {},
              leading: const Icon(Ionicons.information_outline),
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.redAccent,
                ),
              ),
              onTap: () {},
              leading: const Icon(
                Ionicons.log_out_outline,
                color: Colors.redAccent,
              ),
            ),
            ListTile(
              title: const Text(
                'Change Theme',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: Switch(
                value: provider.themeMode == ThemeMode.dark,
                onChanged: (newValue) {
                  provider.toggleTheme(newValue);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
