import 'package:cars/app/core/shared/app_exceptions.dart';
import 'package:cars/app/modules/home/domain/entity/lead_entity.dart';
import 'package:cars/app/modules/home/domain/repository/lead_repository.dart';
import 'package:cars/app/modules/home/infra/datasource/lead_datasource.dart';
import 'package:dart_either/src/dart_either.dart';

class LeadRepositoryImpl implements LeadRepository{
  final LeadDatasource leadDatasource;

  LeadRepositoryImpl({required this.leadDatasource});
  @override
  Future<void> call({required String username, required String phone, required String email}) async{
    final result = await leadDatasource.call(username: username, phone: phone, email: email);

    return result;
  }
  
}