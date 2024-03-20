// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'books')
class Book extends Equatable {
  @PrimaryKey()
  final int id;
  final String title;
  final String author;
  final String imagePath;
  final String hexColor;
  final String description;
  final String rating;
  final String price;
  bool isWishlisted;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imagePath,
    required this.hexColor,
    required this.description,
    required this.rating,
    required this.price,
    this.isWishlisted = false,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      author,
      imagePath,
      hexColor,
      description,
      rating,
      price,
      isWishlisted,
    ];
  }
}
