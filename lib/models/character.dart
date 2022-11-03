class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;

  Character(
    this.id,
    this.name,
    this.status,
    this.species,
    this.gender,
    this.image
  );

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      json["id"],
      json["name"],
      json["status"],
      json["species"],
      json["gender"],
      json["image"]
    );
  }
}
