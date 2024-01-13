import 'package:flutter/material.dart';
import 'package:life_in_pages/model/books.dart';
import 'package:life_in_pages/pages/detail/mobile_detail_page.dart';
import 'package:life_in_pages/pages/detail/web_detail_page.dart';

class DetailPage extends StatelessWidget {
  final Books book;
  const DetailPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 800) {
        return WebDetailPage(book: book);
      } else {
        return MobileDetailPage(book: book);
      }
    });
  }
}
