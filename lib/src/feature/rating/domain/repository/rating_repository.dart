import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';

abstract class RatingRepository {
  Future<Either<Failure, String>> customerRating(int scale, int restaurantId);

}
