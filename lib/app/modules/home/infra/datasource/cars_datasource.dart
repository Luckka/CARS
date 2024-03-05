import 'package:cars/app/core/shared/app_exceptions.dart';
import 'package:cars/app/modules/home/domain/entity/cars_entity.dart';
import 'package:dart_either/dart_either.dart';

abstract interface class CarsDatasource{

  Future<Either<AppExceptions,List<CarsEntity>>> call();
}