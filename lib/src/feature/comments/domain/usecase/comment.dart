import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/comments/domain/repository/comment_repository.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';
import 'package:foodivoire/src/shared/utils/usecase.dart';

class CustomerComment
    implements UseCase<String, MultiParams<String, int, String>> {
  final CommentRepository repo;
  CustomerComment(this.repo);

  @override
  Future<Either<Failure, String>> call(
      MultiParams<String, int, String> param) async {
    return await repo.customerComment(param.data1, param.data2);
  }
}
