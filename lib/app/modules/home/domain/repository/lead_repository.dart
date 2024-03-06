import 'package:cars/app/core/shared/app_exceptions.dart';
import 'package:cars/app/modules/home/domain/entity/lead_entity.dart';
import 'package:dart_either/dart_either.dart';

abstract interface class LeadRepository{
  Future<void> call({
    required String username,
    required String phone,
    required String email,
  });
}