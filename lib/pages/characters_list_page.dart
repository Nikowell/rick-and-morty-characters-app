import 'package:flutter/material.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({Key? key}) : super(key: key);

  @override
  _CharactersListPageState createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: Stack(
          children: const [
            Center(
              child: Text(
                'Rick & Morty',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 30
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(
                  Icons.sort,
                  size: 35,
                  color: Colors.grey,
                ),
                onPressed: null,
              ),
            )
          ],
        ),
      )
    );
  }
}
