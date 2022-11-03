import 'package:floor/floor.dart';

import '../models/character.dart';

@dao
abstract class CharacterDao {
  @Query('SELECT * FROM Character')
  Future<List<Character>> findAllFavoriteCharacters();

  @Query('DELETE FROM Character WHERE id = :id')
  Future<void> deleteFavoriteCharacter(int id);

  @insert
  Future<void> insertFavoriteCharacter(Character character);
}