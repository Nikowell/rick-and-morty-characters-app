import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters_app/pages/characters_list_page.dart';
import 'package:rick_and_morty_characters_app/pages/favorite_characters_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  final List<Widget> _pages = <Widget>[
    const CharactersListPage(),
    const FavoriteCharactersPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.home,
                      size: 38,
                      color: _pageIndex == 0 ? Colors.green : Colors.black,
                    ),
                    onPressed: () {
                      if (_pageIndex != 0) {
                        setState(() {
                          _pageIndex = 0;
                        });
                      }
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0),
                child: VerticalDivider(
                  thickness: 2,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      size: 38,
                      color: _pageIndex == 1 ? Colors.green : Colors.black,
                    ),
                    onPressed: () {
                      if (_pageIndex != 1) {
                        setState(() {
                          _pageIndex = 1;
                        });
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        )
      ),
      body: _pages.elementAt(_pageIndex),
      backgroundColor: Colors.black,
    );
  }
}
