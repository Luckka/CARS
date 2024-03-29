import 'dart:convert';

import 'package:cars/app/core/db/db.dart';
import 'package:cars/app/core/shared/app_exceptions.dart';
import 'package:cars/app/modules/home/domain/entity/lead_entity.dart';
import 'package:cars/app/modules/home/infra/datasource/lead_datasource.dart';
import 'package:cars/app/modules/home/infra/mappers/lead_mapper.dart';
import 'package:dart_either/src/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';

import 'package:http/http.dart' as http;

class LeadDatasourceImpl implements LeadDatasource {
  late Database db;


  String _username = '';
  String _phone = '';
  String _email = '';

  get username => _username;
  get phone => _phone;
  get email => _email;

  LeadDatasourceImpl() {
    _initRepository();
  }

  _initRepository() async {
    await _getLead();
  }

  _getLead() async {
    db = await SqFliteDb.sqFliteDb.database;

    List leads = await db.query('lead');

    _username = leads.first['username'];
  }

  setDateUsers(LeadMapper leadMapper) async {
    db = await SqFliteDb.sqFliteDb.database;
    db.insert('lead', leadMapper.toMap());
    _username = username;
    _phone = phone;
    _email = email;
  }

  @override
  Future<void> call() async {
    db = await SqFliteDb.sqFliteDb.database;

    List<Map<String, dynamic>> result = await db.query("lead");

    try {

      final headers = <String,String>{
        'Content-Type': 'application/json',
      };

     

      List.generate(result.length, (i) async{
      

         final httpResponse = await http.post(Uri.parse("https://www.wswork.com.br/cars/leads"), body: jsonEncode(result[i]),headers: headers);

        

         return httpResponse;

      } );


    } catch (err) {
      print(err);
    }
  }
}
