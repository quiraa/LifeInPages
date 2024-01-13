import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:life_in_pages/model/books.dart';
import '../../widget/favorite_button.dart';

class WebDetailPage extends StatefulWidget {
  final Books book;

  const WebDetailPage({Key? key, required this.book}) : super(key: key);

  @override
  _WebDetailPage createState() => _WebDetailPage();
}

class _WebDetailPage extends State<WebDetailPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: kIsWeb ? null : AppBar(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 64.0),
          child: Center(
            child: SizedBox(
              width: screenWidth <= 1200 ? 800 : 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.asset(widget.book.imageUrl),
                              ),
                              const SizedBox(height: 16.0),
                            ],
                          )),
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.book.title,
                                    style: const TextStyle(
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    widget.book.author,
                                    style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Text(
                                    'Genre: ${widget.book.genre.join(', ')}',
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          const Icon(Icons.groups,
                                              color: Colors.blue),
                                          const SizedBox(height: 10.0),
                                          Text(
                                            'Reviews: ${widget.book.totalReviews}',
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          const Icon(Icons.star_half,
                                              color: Colors.orange),
                                          const SizedBox(height: 10.0),
                                          Text(
                                            'Rating: ${widget.book.rating}',
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          const Icon(Icons.attach_money,
                                              color: Colors.green),
                                          const SizedBox(height: 10.0),
                                          Text(
                                            'USD: ${widget.book.price}',
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                      const Column(
                                        children: [FavoriteButton()],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 16.0),
                                  Text(
                                    widget.book.description,
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ]),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
