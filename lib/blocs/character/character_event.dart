part of 'character_bloc.dart';

@immutable
abstract class CharacterEvent {}

class LoadCharacters extends CharacterEvent {}

class SortAlphabetically extends CharacterEvent {}

class SortReverseAlphabetically extends CharacterEvent {}