import 'package:book_store/config/routes/app_router.dart';
import 'package:book_store/config/routes/screen_routes.dart';
import 'package:book_store/core/utils/books_list.dart';
import 'package:book_store/features/data/models/book.dart';
import 'package:book_store/features/interface/pages/wishlist/components/wishlist_item.dart';
import 'package:book_store/features/interface/provider/book_provider.dart';
import 'package:book_store/features/interface/pages/home/components/books_item.dart';
import 'package:book_store/features/interface/pages/home/components/category_chips.dart';
import 'package:book_store/features/interface/pages/home/components/drawer_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BookProvider _provider;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<BookProvider>(context, listen: false);
    Future.delayed(const Duration(seconds: 2), () {
      _fetchData();
    });
  }

  Future<void> _fetchData() async {
    await _provider.insertAllBooks();
    await _provider.getAllBooks();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      drawer: const DrawerView(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      leading: Builder(builder: (context) {
        return Skeletonizer(
          enabled: _isLoading,
          child: IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(
              Ionicons.menu_outline,
            ),
          ),
        );
      }),
      actions: [
        Skeletonizer(
          enabled: _isLoading,
          child: IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchBarDelegate());
            },
            icon: const Icon(Ionicons.search_outline),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Skeletonizer(
            enabled: _isLoading,
            child: IconButton(
              onPressed: () => AppRouter.push(context, ScreenRoutes.wishlist),
              icon: const Icon(Ionicons.bag_outline),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Skeletonizer(
                enabled: _isLoading,
                child: const Text(
                  'BookStore',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            CategoryChips(loading: _isLoading),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AvailableBookContent(
                  loading: _isLoading,
                  listBooks: _provider.books,
                  onBookClicked: (book) {
                    AppRouter.push(
                      context,
                      ScreenRoutes.detail,
                      arguments: book,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        if (_isLoading)
          const Center(
            child: CupertinoActivityIndicator(),
          ),
      ],
    );
  }
}

class SearchBarDelegate extends SearchDelegate<String> {
  final List<String> suggestions = [
    'Beloved',
    'Middlemarch',
    'Don Quixote',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return AvailableSearchContent(
      query: query,
      onBookClicked: (book) {},
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> filteredSuggestions = suggestions
        .where((suggestion) =>
            suggestion.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredSuggestions.length,
      itemBuilder: (context, index) {
        final suggestion = filteredSuggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
          },
        );
      },
    );
  }
}

class AvailableSearchContent extends StatelessWidget {
  final String query;
  final Function(Book) onBookClicked;

  const AvailableSearchContent({
    Key? key,
    required this.query,
    required this.onBookClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Book> filteredBooks = query.isEmpty
        ? BookObjects().listBooks
        : BookObjects()
            .listBooks
            .where(
              (book) => book.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: filteredBooks.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) => WishlistItem(
        book: filteredBooks[index],
        onWishlistClicked: onBookClicked,
      ),
    );
  }
}
