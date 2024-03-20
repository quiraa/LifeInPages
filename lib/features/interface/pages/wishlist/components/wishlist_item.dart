import 'package:book_store/features/data/models/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class AvailableWishlistContent extends StatelessWidget {
  final List<Book> wishlists;
  final void Function(Book wishlist) onWishlistClicked;

  const AvailableWishlistContent({
    Key? key,
    required this.wishlists,
    required this.onWishlistClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: wishlists.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) => WishlistItem(
        book: wishlists[index],
        onWishlistClicked: onWishlistClicked,
      ),
    );
  }
}

class WishlistItem extends StatelessWidget {
  final Book book;
  final void Function(Book book) onWishlistClicked;

  const WishlistItem({
    Key? key,
    required this.book,
    required this.onWishlistClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onWishlistClicked(book);
      },
      child: Row(
        children: [
          _buildImage(context),
          Expanded(child: _buildInformation()),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.30,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: HexColor(book.hexColor),
      ),
      child: Image.asset(book.imagePath),
    );
  }

  Widget _buildInformation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            book.title,
            overflow: TextOverflow.clip,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            book.author,
            overflow: TextOverflow.clip,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text('\$${book.price}'),
        ],
      ),
    );
  }
}
