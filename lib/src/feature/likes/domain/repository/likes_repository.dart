import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';

abstract class LikesRepository {
  Future<Either<Failure, String>> customerLikes(int menuId);

}
