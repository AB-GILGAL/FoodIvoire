import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/rating/domain/repository/rating_repository.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';
import 'package:foodivoire/src/shared/utils/usecase.dart';

class CustomerRating
    implements UseCase<String, MultiParams<int, int, String>> {
  final RatingRepository repo;
  CustomerRating(this.repo);

  @override
  Future<Either<Failure, String>> call(
      MultiParams<int, int, String> param) async {
    return await repo.customerRating(param.data1, param.data2);
  }
}
