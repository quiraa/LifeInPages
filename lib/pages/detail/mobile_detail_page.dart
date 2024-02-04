import 'package:flutter/material.dart';
import 'package:life_in_pages/model/books.dart';

import '../../widget/favorite_button.dart';

class MobileDetailPage extends StatelessWidget {
  final Books book;
  const MobileDetailPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.lightBlueAccent,
              expandedHeight: 360,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                    tag: book.imageUrl,
                    child: Image.asset(
                      book.imageUrl,
                      fit: BoxFit.cover,
                    )),
                title: Text(book.title),
              ),
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new,
                      color: Colors.white)),
              actions: [const FavoriteButton()],
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.author,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const Icon(Icons.groups, color: Colors.blue),
                        const SizedBox(height: 10.0),
                        Text(
                          book.totalReviews,
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        const Icon(
                          Icons.star_half_sharp,
                          color: Colors.orange,
                        ),
                        const SizedBox(height: 10.0),
                        Text(book.rating,
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600))
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        const Icon(
                          Icons.attach_money,
                          color: Colors.green,
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          'USD: ${book.price}',
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: Text(
                  'Genre : ${book.genre.join(', ')}',
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 16.0),
                child: Text(
                  book.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
