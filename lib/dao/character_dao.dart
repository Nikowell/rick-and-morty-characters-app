import 'package:floor/floor.dart';

import '../models/character.dart';

@dao
abstract class CharacterDao {
  @Query('SELECT * FROM Character')
  Future<List<Character>> findAllFavoriteCharacters();

  @insert
  Future<void> insertFavoriteCharacter(Character character);
}