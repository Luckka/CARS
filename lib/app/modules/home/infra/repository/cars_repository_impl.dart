import 'package:cars/app/core/shared/app_exceptions.dart';
import 'package:cars/app/modules/home/domain/entity/cars_entity.dart';
import 'package:cars/app/modules/home/domain/repository/cars_repository.dart';
import 'package:cars/app/modules/home/infra/datasource/cars_datasource.dart';
import 'package:dart_either/src/dart_either.dart';

class CarsRepositoryImpl implements CarsRepository{

  final CarsDatasource carsDatasource;

  CarsRepositoryImpl({required this.carsDatasource});


  @override
  Future<Either<AppExceptions, List<CarsEntity>>> call() async{
    final result = await carsDatasource.call();

    return result;
  }
  
}