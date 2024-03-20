import 'package:book_store/features/data/models/book.dart';
import 'package:book_store/features/interface/pages/detail/detail_page.dart';
import 'package:book_store/features/interface/pages/home/home_page.dart';
import 'package:book_store/features/interface/pages/wishlist/wishlist_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:book_store/config/routes/screen_routes.dart';

class RouteHandler {
  PageRoute getPageRoute({String? routeName, Widget? screen}) {
    return CupertinoPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => screen!,
    );
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ScreenRoutes.home:
        return getPageRoute(
          routeName: ScreenRoutes.home,
          screen: const HomePage(),
        );

      case ScreenRoutes.detail:
        final book = settings.arguments as Book;
        return getPageRoute(
          routeName: ScreenRoutes.detail,
          screen: DetailPage(book: book),
        );

      case ScreenRoutes.wishlist:
        return getPageRoute(
          routeName: ScreenRoutes.wishlist,
          screen: const WishlistPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No Routes Defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
