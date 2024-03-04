import 'package:cars/app/core/shared/app_exceptions.dart';
import 'package:cars/app/modules/home/domain/entity/cars_entity.dart';
import 'package:cars/app/modules/home/domain/helpers/cars_exception.dart';
import 'package:cars/app/modules/home/infra/datasource/cars_datasource.dart';
import 'package:cars/app/modules/home/infra/mappers/cars_mapper.dart';
import 'package:dart_either/src/dart_either.dart';
import 'package:dio/dio.dart';

class CarsDatasourceImpl implements CarsDatasource{

  final Dio dio;

  CarsDatasourceImpl({required this.dio});

  @override
  Future<Either<AppExceptions, CarsEntity>> call({required int id, required int timestampCadastro, required int modeloId, required int ano, required String combustivel, required int numPortas, required String cor, required String nomeModelo, required int value}) async{
    try{

      final result = await dio.post("https://wswork.com.br/cars.json");


      return Right(CarsMapper.fromMap(result.data));

    }catch(err,s){
       
       return Left(CarsException(message: err.toString(), stackTrace: s));
    }
  }
  
}