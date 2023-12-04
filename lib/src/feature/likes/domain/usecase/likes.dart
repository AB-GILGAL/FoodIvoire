import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/likes/domain/repository/likes_repository.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';
import 'package:foodivoire/src/shared/utils/usecase.dart';

class CustomerLikes
    implements UseCase<String, Param<int>> {
  final LikesRepository repo;
  CustomerLikes(this.repo);

  @override
  Future<Either<Failure, String>> call(
      Param<int> param) async {
    return await repo.customerLikes(param.data);
  }
}
