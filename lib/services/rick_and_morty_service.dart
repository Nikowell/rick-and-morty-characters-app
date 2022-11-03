import 'package:dio/dio.dart';

import '../models/character.dart';

class RickAndMortyService {
  Future<List<Character>> getAllCharacters() async {
    List<Character> characters = [];
    Response response = await Dio().get('https://rickandmortyapi.com/api/character');
    characters = (response.data["results"] as List).map((c) => Character.fromJson(c)).toList();
    return characters;
  }
}