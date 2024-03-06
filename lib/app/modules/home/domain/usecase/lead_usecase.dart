import 'package:cars/app/core/shared/app_exceptions.dart';
import 'package:dart_either/dart_either.dart';

import '../entity/lead_entity.dart';

abstract interface class LeadUseCase{
  Future<void> call({
    required String username,
    required String phone,
    required String email,
  });
}