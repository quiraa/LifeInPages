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
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailPage(book: books[index]);
                }));
              },
              child: Card(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Image.asset(books[index].imageUrl),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                books[index].title,
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 8.0),
                              Text(books[index].author,
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(height: 8.0),
                              Text('Genre: ${books[index].genre.join(', ')}',
                                  style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400))
                            ]),
                      ))
                    ]),
              ),
            );
          }),
    );
  }
}
