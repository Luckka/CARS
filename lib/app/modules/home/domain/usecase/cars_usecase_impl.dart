import 'package:cars/app/core/shared/app_exceptions.dart';
import 'package:cars/app/modules/home/domain/entity/cars_entity.dart';
import 'package:cars/app/modules/home/domain/repository/cars_repository.dart';
import 'package:cars/app/modules/home/domain/usecase/cars_usecase.dart';
import 'package:dart_either/src/dart_either.dart';

class CarsUseCaseImpl implements CarsUseCase {
  final CarsRepository carsRepository;

  CarsUseCaseImpl({required this.carsRepository});

  @override
  Future<Either<AppExceptions, List<CarsEntity>>> call() async {
    final result = await carsRepository.call();

    return result;
  }
}
