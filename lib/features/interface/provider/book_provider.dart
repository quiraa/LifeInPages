import 'package:book_store/core/utils/books_list.dart';
import 'package:book_store/features/data/models/book.dart';
import 'package:book_store/features/data/services/app_database.dart';
import 'package:flutter/foundation.dart';

class BookProvider extends ChangeNotifier {
  List<Book> _books = [];
  List<Book> get books => _books;

  List<Book> _wishlist = [];
  List<Book> get wishlist => _wishlist;

  Future<AppDatabase> _createDatabase() async {
    return await $FloorAppDatabase.databaseBuilder('books.database.db').build();
  }

  Future<void> insertAllBooks() async {
    final database = await _createDatabase();
    final books = await database.dao.insertAllBook(BookObjects().listBooks);
    notifyListeners();
    return books;
  }

  Future<void> getAllBooks() async {
    final database = await _createDatabase();
    final allBooks = await database.dao.getAllBooks();
    if (allBooks.isNotEmpty) {
      _books = allBooks;
    }
    notifyListeners();
  }

  Future<void> getAllWishlist() async {
    final database = await _createDatabase();
    final wishlists = await database.dao.getAllWishlistedBooks();
    if (wishlists.isNotEmpty) {
      _wishlist = wishlists;
      notifyListeners();
    } else {
      _wishlist = [];
      notifyListeners();
    }
  }

  Future<void> updateWishlistBook(int id, bool isWishlist) async {
    final database = await _createDatabase();
    await database.dao.updateWishlistedBook(id, isWishlist);
    notifyListeners();
  }
}
