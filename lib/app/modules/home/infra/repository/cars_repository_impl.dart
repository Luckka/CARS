import 'package:cars/app/core/shared/app_exceptions.dart';
import 'package:cars/app/modules/home/domain/entity/cars_entity.dart';
import 'package:cars/app/modules/home/domain/repository/cars_repository.dart';
import 'package:cars/app/modules/home/infra/datasource/cars_datasource.dart';
import 'package:dart_either/src/dart_either.dart';

class CarsRepositoryImpl implements CarsRepository{

  final CarsDatasource carsDatasource;

  CarsRepositoryImpl({required this.carsDatasource});


  @override
  Future<Either<AppExceptions, CarsEntity>> call({required int id, required int timestampCadastro, required int modeloId, required int ano, required String combustivel, required int numPortas, required String cor, required String nomeModelo, required int value}) async{
    final result = await carsDatasource.call(id: id, timestampCadastro: timestampCadastro, modeloId: modeloId, ano: ano, combustivel: combustivel, numPortas: numPortas, cor: cor, nomeModelo: nomeModelo, value: value);

    return result;
  }
  
}