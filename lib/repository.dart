import 'package:organizer_app/database_conection.dart';
import 'package:sqflite/sqflite.dart';

class Repository{
  DatabaseConection _databaseConection;

  Repository(){
    _databaseConection = DatabaseConection();
  }
  static Database _database;

  Future <Database>  get database async{
    if (_database != null) return _database;
    _database = await _databaseConection.setDataBase();
    return _database;
  }

  insertData (table, data) async{
    var connection = await database;
    return await connection.insert(table, data);
  }
  readData (table) async{
    var connection = await database;
    return await connection.query(table);
  }
}