import 'package:flutter/material.dart';
import 'package:life_in_pages/model/books.dart';
import 'package:life_in_pages/pages/home/books_grid.dart';
import 'package:life_in_pages/pages/home/books_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LifeInPages'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 620) {
            return BooksList(books: listOfBooks); // Mobile View
          } else if (constraints.maxWidth <= 1200) {
            return BooksGrid(books: listOfBooks, gridCount: 3);
          } else {
            return BooksGrid(books: listOfBooks, gridCount: 5);
          }
        },
      ),
    );
  }
}
