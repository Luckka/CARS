import 'package:cars/app/modules/home/domain/entity/cars_entity.dart';

class CarsMapper extends CarsEntity {
  CarsMapper(
      {required super.ano,
      required super.combustivel,
      required super.cor,
      required super.id,
      required super.modeloId,
      required super.nomeModelo,
      required super.numPortas,
      required super.timestampCadastro,
      required super.value});

 static Map<String, dynamic> toMap(CarsEntity carsEntity) {
    return <String, dynamic>{
      'ano': carsEntity.ano,
      'combustivel': carsEntity.combustivel,
      'cor': carsEntity.cor,
      'id': carsEntity.id,
      'modeloId': carsEntity.modeloId,
      'nomeModelo': carsEntity.nomeModelo,
      'numPortas': carsEntity.numPortas,
      'timestampCadastro': carsEntity.timestampCadastro,
      'value': carsEntity.value
    };
  }

  static CarsEntity fromMap(Map<String, dynamic> map) {
    return CarsEntity(
        id: map['id'],
        timestampCadastro: map['timestampCadastro'],
        modeloId: map['modeloId'],
        ano: map['ano'],
        combustivel: map['combustivel'],
        numPortas: map['numPortas'],
        cor: map['cor'],
        nomeModelo: map['nomeModelo'],
        value: map['value']);
  }
}
