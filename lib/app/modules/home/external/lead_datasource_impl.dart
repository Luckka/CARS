import 'package:cars/app/core/db/db.dart';
import 'package:sqflite/sqflite.dart';

class LeadDatasourceImpl{

  late Database db;

  String _username = '';
  String _phone = '';
  String _email = '';

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

  setDateUsers(String username,String email,String phone) async{
    db = await SqFliteDb.sqFliteDb.database;
    db.insert('lead', {
      'username': username,
      'email': email,
      'phone': phone
    });
    _username = username;
    _phone = phone;
    _email = email;
  }
}