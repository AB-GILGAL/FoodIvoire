import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/comments/domain/repository/comment_repository.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';
import 'package:foodivoire/src/shared/utils/usecase.dart';

import '../../../Vendors/domain/entities/vendor_model.dart';

class CustomerComment
    implements UseCase<Comment, MultiParams<String, int, String>> {
  final CommentRepository repo;
  CustomerComment(this.repo);

  @override
  Future<Either<Failure, Comment>> call(
      MultiParams<String, int, String> param) async {
    return await repo.customerComment(param.data1, param.data2);
  }
}

class CustomerMenuComment
    implements UseCase<Comment, MultiParams<String, int, String>> {
  final MenuCommentRepository repo;
  CustomerMenuComment(this.repo);

  @override
  Future<Either<Failure, Comment>> call(
      MultiParams<String, int, String> param) async {
    return await repo.customerMenuComment(param.data1, param.data2);
  }
}
