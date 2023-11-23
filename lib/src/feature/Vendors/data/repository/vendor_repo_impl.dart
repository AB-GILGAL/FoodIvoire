import 'dart:io';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/Vendors/data/api/api_service.dart';
import 'package:foodivoire/src/feature/Vendors/domain/entities/vendor_model.dart';
import 'package:foodivoire/src/feature/Vendors/domain/repository/vendor_repo.dart';
import 'package:foodivoire/src/shared/errors/exception.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';

class RestaurantRepoImpl implements RestaurantRepo {
  final RestaurantApiService api;

  RestaurantRepoImpl(this.api);

  @override
  Future<Either<Failure, List<RestaurantDataModel>>> fetchRestaurants()async {
    try {
      final result = await api.fetchRestaurants();
      return Right(result);
    } on CustomException catch (failure) {
      return Left(Failure(failure.message));
    } on SocketException catch (_) {
      return Left(Failure('You are offline. Connect and retry'));
    } catch (e) {
      log('$e');
      return Left(Failure('something went wrong'));
    }
  }
}