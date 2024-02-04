import 'package:flutter/material.dart';
import 'package:life_in_pages/model/books.dart';
import 'package:life_in_pages/pages/detail/detail_page.dart';

class BooksGrid extends StatelessWidget {
  final List<Books> books;
  final int gridCount;
  const BooksGrid({Key? key, required this.books, required this.gridCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: gridCount,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      children:
          books.map((books) => _buildBookGridItem(context, books)).toList(),
    );
  }
}

Widget _buildBookGridItem(BuildContext context, Books books) {
  return Card(
    clipBehavior: Clip.antiAlias,
    child: InkWell(
        onTap: () => Navigator.pushNamed(context, DetailPage.routeName,
            arguments: books),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                books.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                books.title,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                books.author,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
            )
          ],
        )),
  );
}
