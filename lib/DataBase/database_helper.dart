import 'package:best_book_seller/Models/User_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'dart:io' as io;
import '../Models/user_response_model.dart';

class DbHelper {
  static Database? _db;
  UserRespose? model;
  static String tableName = "User";
  static String userId = "id";
  static String userName = "UserName";
  static String userEmail = "Email";
  static String userPassword = "Password";
  static final DbHelper instance = DbHelper.instance;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'book.db');
    var db = openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tableName ($userId INTEGER PRIMARY KEY AUTOINCREMENT ,$userName TEXT, $userEmail TEXT , $userPassword TEXT )');
  }

  Future<UserRespose?> getLoginUser(UserModelInfo user) async {
    var dbClient = await db;
    if (dbClient != null) {
      List<Map<String, dynamic>> checkEmail = await dbClient.query(tableName,
          where: '$userEmail = ?', whereArgs: ['${user.email}']);
      if (checkEmail.isNotEmpty) {
        List<Map<String, dynamic>> checkPassword = await dbClient.query(
            tableName,
            where: '$userPassword = ?',
            whereArgs: ['${user.password}']);

        if (checkPassword.isNotEmpty) {
          model = UserRespose(isSuccess: true, message: "Login Successfull");
          return model;
        } else {
          model = UserRespose(isSuccess: false, message: "Password Not Match");
          return model;
        }
      } else {
        model = UserRespose(isSuccess: false, message: "Email Not Match");
        return model;
      }
    } else {
      model = UserRespose(isSuccess: false, message: "Data Base Error");
      return model;
    }
  }

  Future<UserRespose?> saveUserInfo(UserModelInfo user) async {
    var dbClient = await db;
    List<Map<String, dynamic>> check = await dbClient!.query(tableName,
        where: '$userEmail = ?', whereArgs: ['${user.email}']);
    if (check.isNotEmpty) {
      model = UserRespose(isSuccess: true, message: "Email already Registered");
      return model;
    } else {
      await dbClient.insert(tableName, user.toMap());
      model = UserRespose(isSuccess: true, message: "Register  Successfull");
      return model;
    }
  }
}
