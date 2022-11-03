import 'dart:async';
import 'package:floor/floor.dart';
import 'package:rick_and_morty_characters_app/models/favorite_character.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [FavoriteCharacter])
abstract class AppDatabase extends FloorDatabase {
  FavoriteCharacterDao get favoriteCharacterDao;
}