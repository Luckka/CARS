import 'package:cars/app/core/shared/app_exceptions.dart';
import 'package:cars/app/modules/home/domain/entity/lead_entity.dart';
import 'package:cars/app/modules/home/domain/repository/lead_repository.dart';
import 'package:cars/app/modules/home/domain/usecase/lead_usecase.dart';
import 'package:dart_either/src/dart_either.dart';

class LeadUseCaseImpl implements LeadUseCase{

  final LeadRepository leadRepository;

  LeadUseCaseImpl({required this.leadRepository});

  @override
  Future<void> call({required String username, required String phone, required String email}) async{
    final result = await leadRepository.call(username: username, phone: phone, email: email);

    return result;
  }
  
}