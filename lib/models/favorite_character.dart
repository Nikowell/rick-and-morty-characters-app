import 'package:floor/floor.dart';

@entity
class FavoriteCharacter {
  @primaryKey
  final int id;
  final String name;

  FavoriteCharacter(this.id, this.name);
}

@dao
abstract class FavoriteCharacterDao {
  @insert
  Future<void> insertFavoriteCharacter(FavoriteCharacter favoriteCharacter);
}