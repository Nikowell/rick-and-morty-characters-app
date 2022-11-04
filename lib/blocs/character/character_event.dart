part of 'character_bloc.dart';

@immutable
abstract class CharacterEvent {}

class LoadCharacters extends CharacterEvent {}

class LoadMoreCharacters extends CharacterEvent {}

class UpdateFavoriteStatus extends CharacterEvent {
  final Character character;

  UpdateFavoriteStatus(this.character);
}

class SortAlphabetically extends CharacterEvent {}

class SortReverseAlphabetically extends CharacterEvent {}