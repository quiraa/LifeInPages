import 'dart:core';

import 'package:book_store/features/data/models/book.dart';
import 'package:floor/floor.dart';

@dao
abstract class AppDao {
  @Query('SELECT * FROM books')
  Future<List<Book>> getAllBooks();

  @Query('SELECT * FROM books WHERE isWishlisted = 1')
  Future<List<Book>> getAllWishlistedBooks();

  @Query('SELECT * FROM books WHERE id = :id')
  Future<Book?> getBook(int id);

  @Query("SELECT * FROM books WHERE title LIKE '%' || :query || '%")
  Future<List<Book>> searchBooks(String query);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAllBook(List<Book> listBooks);

  @Query('UPDATE books SET isWishlisted = :isWishlist WHERE id = :id')
  Future<void> updateWishlistedBook(int id, bool isWishlist);
}
