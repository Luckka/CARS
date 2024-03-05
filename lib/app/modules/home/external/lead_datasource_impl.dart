import 'package:cars/app/core/db/db.dart';
import 'package:sqflite/sqflite.dart';

class LeadDatasourceImpl{

  late Database db;

  String _username = '';

  get username => _username;

  LeadDatasourceImpl(){
    _initRepository();
  }

  _initRepository() async{
    await _getLead();
  }



  _getLead() async{
    db = await SqFliteDb.sqFliteDb.database;

    List leads = await db.query('lead');

    _username = leads.first['username'];

  }

  setUsername(String username) async{
    db = await SqFliteDb.sqFliteDb.database;
    db.insert('lead', {
      'username': username
    });
    _username = username;
  }
}