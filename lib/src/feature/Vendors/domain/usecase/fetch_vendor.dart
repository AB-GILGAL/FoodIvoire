import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/Vendors/domain/entities/vendor_model.dart';
import 'package:foodivoire/src/feature/Vendors/domain/repository/vendor_repo.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';
import 'package:foodivoire/src/shared/utils/usecase.dart';

class FetchRestaurants extends UseCase<List<RestaurantDataModel>, NoParams> {
  final RestaurantRepo repo;

  FetchRestaurants(this.repo);

  @override
  Future<Either<Failure, List<RestaurantDataModel>>> call(
      NoParams params) async {
    return await repo.fetchRestaurants();
  }
}
