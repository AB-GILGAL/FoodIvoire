import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/rating/data/api/api_service.dart';
import 'package:foodivoire/src/feature/rating/domain/repository/rating_repository.dart';

import 'package:foodivoire/src/shared/errors/exception.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';

class RatingRepoImpl implements RatingRepository {
  final RatingApiService api;

  RatingRepoImpl(this.api);
 

  @override
  Future<Either<Failure, String>> customerRating (
      int scale, int restaurantId) async {
    try {
     await api.customerRating(scale, restaurantId);
      return  const Right('Done');
    } on CustomException catch (error) {
      return Left(Failure(error.message));
      
    } on SocketException {
      return Left(Failure('You are offline. Check your network.'));
    } catch (e) {
      return Left(Failure('$e'));
    }
  }

}
