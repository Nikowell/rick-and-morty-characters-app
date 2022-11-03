import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_characters_app/blocs/favorite_character/favorite_character_bloc.dart';
import 'package:rick_and_morty_characters_app/models/favorite_character.dart';
import 'package:rick_and_morty_characters_app/pages/characters_list_page.dart';
import 'package:rick_and_morty_characters_app/pages/favorite_characters_page.dart';

import 'database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db')
      .build();
  final favoriteCharacterDao = database.favoriteCharacterDao;

  runApp(App(favoriteCharacterDao: favoriteCharacterDao));
}

class App extends StatelessWidget {
  final FavoriteCharacterDao favoriteCharacterDao;

  const App({super.key, required this.favoriteCharacterDao});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(favoriteCharacterDao: favoriteCharacterDao),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.favoriteCharacterDao});

  final FavoriteCharacterDao favoriteCharacterDao;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    _pages = <Widget>[
      BlocProvider(
        create: (context) => FavoriteCharacterBloc(widget.favoriteCharacterDao),
        child: const CharactersListPage(),
      ),
      const FavoriteCharactersPage()
    ];
    super.initState();
  }

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
