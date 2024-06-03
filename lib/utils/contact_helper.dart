import 'package:gooto/models/save_model.dart';
import 'package:sqflite/sqflite.dart';

// image , title , raised , day left , uid
final String tableSave = 'savetable';
final String columnId = 'id';
final String columntitle = 'title';
final String columnImg = 'imgurl';
final String columnUID = 'uid';

class ContactHelper {
  static Database? _database;
  static ContactHelper? _contactHelper;

  ContactHelper._createInstance();
  factory ContactHelper() {
    if (_contactHelper == null) {
      _contactHelper = ContactHelper._createInstance();
    }
    return _contactHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    print("----------init db-------------");
    var dir = await getDatabasesPath();
    var path = dir + "moharikdb.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          create table $tableSave (
          $columnId integer primary key autoincrement,
          $columntitle text not null,
          $columnImg text not null,
          $columnUID text not null)
        ''');
      },
    );
    return database;
  }

  Future insertSave(SaveModel alarmInfo) async {
    var db = await this.database;
    int result = await db.insert(
      tableSave,
      alarmInfo.toJson(),
    );
    print('result : $result');
  }

  Future<List<SaveModel>> getSaves() async {
    List<SaveModel> saves = [];

    var db = await this.database;
    var result = await db.query(tableSave);
    result.forEach((element) {
      var saveinfo = SaveModel.fromData(element);
      saves.add(saveinfo);
    });

    return saves;
  }

  Future<int> delete(int id) async {
    var db = await this.database;
    return await db.delete(tableSave, where: '$columnId = ?', whereArgs: [id]);
  }
}
