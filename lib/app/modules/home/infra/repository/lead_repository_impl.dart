import 'package:cars/app/modules/home/domain/repository/lead_repository.dart';
import 'package:cars/app/modules/home/infra/datasource/lead_datasource.dart';


class LeadRepositoryImpl implements LeadRepository{
  final LeadDatasource leadDatasource;

  LeadRepositoryImpl({required this.leadDatasource});
  @override
  Future<void> call() async{
    final result = await leadDatasource.call();

    return result;
  }
  
}