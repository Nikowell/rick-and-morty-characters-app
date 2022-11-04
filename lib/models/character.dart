import 'package:floor/floor.dart';

@entity
class Character {
  @primaryKey
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String? origin;
  final String image;
  bool isFavorite;

  Character(
    this.id,
    this.name,
    this.status,
    this.species,
    this.gender,
    this.origin,
    this.image,
    this.isFavorite
  );

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      json["id"],
      json["name"],
      json["status"],
      json["species"],
      json["gender"],
      json["origin"] != null ? json["origin"]["name"] : null,
      json["image"],
      false
    );
  }
}

