import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/character_dao.dart';
import 'models/character.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Character])
abstract class AppDatabase extends FloorDatabase {
  CharacterDao get characterDao;
}