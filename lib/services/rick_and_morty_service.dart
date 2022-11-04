import 'package:dio/dio.dart';
import 'package:rick_and_morty_characters_app/models/api_schema.dart';

class RickAndMortyService {
  Future<ApiSchema> getCharacters({String? next}) async {
    late ApiSchema apiSchema;
    Response response = await Dio().get(next ?? 'https://rickandmortyapi.com/api/character');
    apiSchema = ApiSchema.fromJson(response.data);
    return apiSchema;
  }
}