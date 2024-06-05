// import 'dart:async';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../models/card_model.dart';

// const String tableCards = '''
// CREATE TABLE cards (
//   id INTEGER PRIMARY KEY AUTOINCREMENT,
//   price INTEGER NOT NULL,
//   place TEXT NOT NULL,
//   isLiked INTEGER NOT NULL,
//   desc TEXT NOT NULL,
//   img TEXT NOT NULL
// );
// ''';

// class CardCubit extends Cubit<List<CardModule>> {
//   CardCubit() : super([]);
//   Database? _db;

//   Future<void> openDb() async {
//     final databasePath = await getDatabasesPath();
//     final path = join(databasePath, 'cards.db');
//     _db = await openDatabase(path, version: 1, onCreate: (db, version) {
//       db.execute(tableCards);
//     });
//     emit(await getAllCards());
//   }

//   Future<List<CardModule>> getAllCards() async {
//     final db = _db;
//     if (db == null) return [];
//     final List<Map<String, dynamic>> maps = await db.query('cards');
//     return List.generate(
//       maps.length,
//       (i) {
//         return CardModule(
//           id: maps[i]['id'],
//           price: maps[i]['price'],
//           place: maps[i]['place'],
//           isLiked: maps[i]['isLiked'] == 1,
//           desc: maps[i]['desc'],
//           img: maps[i]['img'],
//         );
//       },
//     );
//   }

//   Future<void> insertCard(CardModule card) async {
//     final db = _db;
//     if (db == null) throw Exception('Database not open');
//     await db.insert('cards', card.toMap());
//     emit(await getAllCards());
//   }

//   Future<void> updateCard(CardModule card) async {
//     final db = _db;
//     if (db == null) throw Exception('Database not open');
//     await db.update('cards', card.copyWith(isLiked: !card.isLiked).toMap(),
//         where: 'id = ?', whereArgs: [card.id]);
//     emit(await getAllCards());
//   }

//   Future<void> deleteCard(int id) async {
//     final db = _db;
//     if (db == null) throw Exception('Database not open');
//     await db.delete('cards', where: 'id = ?', whereArgs: [id]);
//     emit(await getAllCards());
//   }

//   Future<void> toggleLike(int id) async {
//     final db = _db;
//     if (db == null) throw Exception('Database not open');
//     final card = (await getAllCards()).firstWhere((element) => element.id == id);
//     await db.update('cards', card.copyWith(isLiked: !card.isLiked).toMap(),where: 'id = ?', whereArgs: [id]);
//     emit(await getAllCards());
//   }
// }

// extension CardModuleExtension on CardModule {
//   Map<String, dynamic> toMap() => {
//         'price': price,
//         'place': place,
//         'isLiked': isLiked ? 1 : 0,
//         'desc': desc,
//         'img': img,
//       };
// }
import 'package:bloc/bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../config/demo.dart';
import '../../models/blog_model.dart';
import '../../models/card_model.dart';
import 'blog_state.dart';

class BlogsTwoCubit extends Cubit<BlogsTwoState> {
  BlogsTwoCubit() : super(BlogsInitial());

  // static Database? _database;

  // Future<Database> get database async {
  //   if (_database != null) return _database!;

  //   _database = await _initDatabase('blogs.db');
  //   return _database!;
  // }

  // Future<Database> _initDatabase(String path) async {
  //   final dbPath = await getDatabasesPath();
  //   final fullPath = join(dbPath, path);

  //   return await openDatabase(fullPath,
  //       version: 1,
  //       onCreate: (db, version) => db.execute(
  //           'CREATE TABLE blogs (id INTEGER PRIMARY KEY AUTOINCREMENT, place TEXT NOT NULL, price INTEGER, isLiked INTEGER DEFAULT 0, desc TEXT, img TEXT)'));
  // }

  // Future<void> insertBlogs(List<CardModule> cardsList) async {
  //   final db = await database;
  //   final batch = db.batch();
  //   for (final card in cardsList) {
  //     batch.insert('blogs', card.toJson());
  //   }
  //   await batch.commit();
  // }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase('blogs.db');
    return _database!;
  }

  Future<Database> _initDatabase(String path) async {
    final dbPath = await getDatabasesPath();
    final fullPath = join(dbPath, path);

    return await openDatabase(fullPath,
        version: 1,
        onCreate: (db, version) => db.execute(
            'CREATE TABLE blogs (id INTEGER PRIMARY KEY AUTOINCREMENT, place TEXT NOT NULL, price INTEGER, isLiked INTEGER DEFAULT 0, desc TEXT, img TEXT)'));
  }

  Future<void> clearAllBlogs() async {
    final db = await database;
    await db.delete('blogs');
  }

  Future<void> insertBlogs(List<CardModule> cardsList) async {
    final db = await database;
    final batch = db.batch();
    for (final card in cardsList) {
      final existingCard = await db.query(
        'blogs',
        where: 'place = ? AND price = ? AND desc = ? AND img = ?',
        whereArgs: [card.place, card.price, card.desc, card.img],
      );
      if (existingCard.isEmpty) {
        batch.insert('blogs', card.toJson());
      }
    }
    await batch.commit();
  }

  // Future<void> insertBlogs(List<CardModule> cardsList) async {
  //   final db = await database;
  //   final batch = db.batch();
  //   for (final card in cardsList) {
  //     batch.insert('blogs', card.toJson());
  //   }
  //   await batch.commit();
  // }

  Future<void> updateLikeStatus(int id, int isLiked) async {
    final db = await database;
    print("db::>${db}");
    await db.update('blogs', {'isLiked': isLiked},
        where: 'id = ?', whereArgs: [id]);
    print("id::>${id}");
  }

  Future<List<CardModule>> getCards() async {
    final db = await database;
    final maps = await db.query('blogs');
    return List.generate(maps.length, (i) => CardModule.fromJson(maps[i]));
  }

  void loadBlogs() async {
    await insertBlogs(cardsList);
    final loadedCards = await getCards();
    print("data from db:::>${loadedCards}");
    emit(BlogsLoaded(loadedCards));
  }

  Future<void> getLikedBlogs() async {
    final likedBlogs = await _fetchLikedBlogs();
    emit(BlogsLoaded(likedBlogs));
  }

  Future<List<CardModule>> _fetchLikedBlogs() async {
    final database = await openDatabase('blogs.db');
    final maps = await database.query(
      'blogs',
      where: 'isLiked = 1',
    );
    print("length is ::> ${maps.length}");
    final likedBlogs = maps.map((map) => CardModule.fromJson(map)).toList();
    return likedBlogs;
  }
}
