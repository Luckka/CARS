import 'package:cars/app/core/shared/app_exceptions.dart';
import 'package:cars/app/modules/home/domain/entity/cars_entity.dart';
import 'package:dart_either/dart_either.dart';

abstract interface class CarsUseCase{

  Future<Either<AppExceptions,CarsEntity>> call({
  required int id,
  required int timestampCadastro,
  required int modeloId,
  required int ano,
  required String combustivel,
  required int numPortas,
  required String cor,
  required String nomeModelo,
  required int value,

  });
}