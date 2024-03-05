import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqFliteDb{
  SqFliteDb._();

  static final SqFliteDb sqFliteDb = SqFliteDb._();

  static Database? _database;
  
  get database async{
    if(_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async{
    return await openDatabase(
      join(await getDatabasesPath(), 'cars.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db,version) async{
    await db.execute(_lead);
    await db.insert('lead', {'username': ''});

  }

  String get _lead => '''
    CREATE TABLE lead (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT,
      email TEXT,
      phone TEXT
    )
  ''';



}