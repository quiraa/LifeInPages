import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:book_store/features/data/models/book.dart';
import 'package:book_store/features/data/services/app_dao.dart';
import 'package:floor/floor.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [Book])
abstract class AppDatabase extends FloorDatabase {
  AppDao get dao;
}
