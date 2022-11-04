import 'character.dart';
import 'info.dart';

class ApiSchema {
  final Info info;
  final List<Character> results;

  ApiSchema(this.info, this.results);

  factory ApiSchema.fromJson(Map<String, dynamic> json) {
    return ApiSchema(
      Info.fromJson(json["info"]),
      List<Character>.from(json['results'].map((x) => Character.fromJson(x)))
    );
  }
}