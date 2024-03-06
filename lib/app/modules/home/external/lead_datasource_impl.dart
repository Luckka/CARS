import 'dart:convert';

import 'package:cars/app/core/db/db.dart';
import 'package:cars/app/core/shared/app_exceptions.dart';
import 'package:cars/app/modules/home/domain/entity/lead_entity.dart';
import 'package:cars/app/modules/home/infra/datasource/lead_datasource.dart';
import 'package:dart_either/src/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';

import 'package:http/http.dart' as http;


class LeadDatasourceImpl implements LeadDatasource{

  late Database db;

  final Dio dio;

  String _username = '';
  String _phone = '';
  String _email = '';

  get username => _username;

  LeadDatasourceImpl({required this.dio}){
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

  @override
  Future<void> call({required String username, required String phone, required String email}) async{
    db = await SqFliteDb.sqFliteDb.database;

     List<Map<String,dynamic>> result = await db.query("lead");

   

      try{

        print(result.first);

       await dio.post("https://www.wswork.com.br/cars/leads/",data: result);


      }catch(err){
        print(err);
      }

     



  }
}