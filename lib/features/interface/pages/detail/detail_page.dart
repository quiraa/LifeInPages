import 'package:book_store/features/data/models/book.dart';
import 'package:book_store/config/routes/app_router.dart';
import 'package:book_store/features/interface/pages/detail/components/product_counter.dart';
import 'package:book_store/features/interface/pages/detail/components/purchase_button.dart';
import 'package:book_store/features/interface/pages/detail/components/wishlist_button.dart';
import 'package:book_store/features/interface/provider/book_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final Book book;
  const DetailPage({Key? key, required this.book}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late BookProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<BookProvider>(context, listen: false);
  }

  void _toggleWishlist() {
    setState(() {
      widget.book.isWishlisted = !widget.book.isWishlisted;
    });
    _provider.updateWishlistBook(widget.book.id, widget.book.isWishlisted);
  }

  @override
  void dispose() {
    super.dispose();
    _provider.getAllWishlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: HexColor(widget.book.hexColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              IconButton(
                onPressed: () => AppRouter.pop(context),
                icon: const Icon(
                  CupertinoIcons.chevron_back,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recommended Books',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      widget.book.title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Hero(
                  tag: '${widget.book.id}',
                  child: Image.asset(
                    widget.book.imagePath,
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.0,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        widget.book.author,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.book.description,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Price: \$${widget.book.price}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          ProductCounter(
                            buttonColor: HexColor(widget.book.hexColor),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          WishlistButton(
                            isWishlisted: widget.book.isWishlisted,
                            buttonColor: HexColor(widget.book.hexColor),
                            onAddWishlist: () {
                              _toggleWishlist();
                            },
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: PurchaseButton(
                              buttonColor: HexColor(widget.book.hexColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
