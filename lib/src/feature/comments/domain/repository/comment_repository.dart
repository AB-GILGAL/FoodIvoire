import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';

abstract class CommentRepository {
  Future<Either<Failure, String>> customerComment(String comment, int restaurantId);

}

abstract class MenuCommentRepository {
  Future<Either<Failure, String>> customerMenuComment(String comment, int menuId);

}