import 'package:book_store/config/routes/app_router.dart';
import 'package:book_store/config/routes/screen_routes.dart';
import 'package:book_store/features/interface/pages/wishlist/components/wishlist_item.dart';
import 'package:book_store/features/interface/provider/book_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  late BookProvider _provider;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<BookProvider>(context, listen: false);
    _fetchData();
    print(_provider.wishlist);
  }

  Future<void> _fetchData() async {
    await _provider.getAllWishlist();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        leading: IconButton(
          onPressed: () => AppRouter.pop(context),
          icon: const Icon(CupertinoIcons.chevron_back),
        ),
      ),
      body: Consumer<BookProvider>(
        builder: (context, provider, _) {
          if (provider.wishlist.isNotEmpty) {
            return AvailableWishlistContent(
              wishlists: provider.wishlist,
              onWishlistClicked: (wishlist) => AppRouter.push(
                context,
                ScreenRoutes.detail,
                arguments: wishlist,
              ),
            );
          } else {
            if (!_isLoading) {
              return const Center(
                child: Text('Empty'),
              );
            } else {
              return const Center();
            }
          }
        },
      ),
    );
  }
}
