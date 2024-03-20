import 'package:book_store/config/routes/route_handler.dart';
import 'package:book_store/config/routes/screen_routes.dart';
import 'package:book_store/config/theme/themes.dart';
import 'package:book_store/features/interface/provider/book_provider.dart';
import 'package:book_store/features/interface/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => BookProvider()),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          title: 'BookStore',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().lightTheme(),
          darkTheme: AppTheme().darkTheme(),
          themeMode: themeProvider.themeMode,
          onGenerateRoute: RouteHandler().onGenerateRoute,
          initialRoute: ScreenRoutes.home,
        );
      },
    );
  }
}
