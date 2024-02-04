import 'package:flutter/material.dart';
import 'package:life_in_pages/model/books.dart';
import 'package:life_in_pages/pages/detail/detail_page.dart';

class BooksList extends StatelessWidget {
  final List<Books> books;
  const BooksList({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) =>
              _buildBookListItem(context, books[index])),
    );
  }
}

Widget _buildBookListItem(BuildContext context, Books books) {
  return Card(
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: () =>
          Navigator.pushNamed(context, DetailPage.routeName, arguments: books),
      child:
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Expanded(
          flex: 1,
          child: Hero(tag: books.imageUrl, child: Image.asset(books.imageUrl)),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  books.title,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8.0),
                Text(books.author,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8.0),
                Text('Genre: ${books.genre.join(', ')}',
                    style: const TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.w400))
              ]),
        ))
      ]),
    ),
  );
}
