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
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: books.map((books) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(book: books);
              }));
            },
            child: Card(
              child: Column(children: <Widget>[
                Expanded(
                    child: Image.asset(
                  books.imageUrl,
                  fit: BoxFit.cover,
                )),
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
              ]),
            ),
          );
        }).toList(),
      ),
    );
  }
}
