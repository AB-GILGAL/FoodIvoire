import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/Vendors/domain/entities/vendor_model.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';

abstract class CommentRepository {
  Future<Either<Failure, Comment>> customerComment(String comment, int restaurantId);

}

abstract class MenuCommentRepository {
  Future<Either<Failure, Comment>> customerMenuComment(String comment, int menuId);

}