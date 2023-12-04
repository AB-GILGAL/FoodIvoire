import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';

abstract class CommentRepository {
  Future<Either<Failure, String>> customerComment(String comment, int restaurantId);

}
