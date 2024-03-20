import 'package:book_store/features/data/models/book.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AvailableBookContent extends StatelessWidget {
  final List<Book> listBooks;
  final void Function(Book book) onBookClicked;
  final bool loading;

  const AvailableBookContent({
    Key? key,
    required this.listBooks,
    required this.onBookClicked,
    this.loading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: listBooks.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) => BooksItem(
        loading: loading,
        book: listBooks[index],
        onBookClicked: onBookClicked,
      ),
    );
  }
}

class BooksItem extends StatelessWidget {
  final Book book;
  final void Function(Book book) onBookClicked;
  final bool loading;

  const BooksItem({
    Key? key,
    required this.book,
    required this.onBookClicked,
    this.loading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onBookClicked(book),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Skeletonizer(
              ignoreContainers: true,
              enabled: loading,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: HexColor(book.hexColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Hero(
                  tag: '${book.id}',
                  child: Image.asset(book.imagePath),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Skeletonizer(
              enabled: loading,
              child: Text(
                book.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Skeletonizer(
            enabled: loading,
            child: Text(
              '\$${book.price}',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
