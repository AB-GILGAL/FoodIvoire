import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/Vendors/domain/entities/vendor_model.dart';
import 'package:foodivoire/src/feature/Vendors/domain/usecase/fetch_vendor.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';
import 'package:foodivoire/src/shared/utils/usecase.dart';


class RestaurantProvider extends ChangeNotifier {
  final FetchRestaurants _fetchRestaurants;

  RestaurantProvider(
      {required FetchRestaurants fetchRestaurants,
})
      : _fetchRestaurants = fetchRestaurants;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(loading) {
    _isLoading = loading;
  }

  //fetch Vendors 
  Future<Either<Failure, List<RestaurantDataModel>>> fetchRestaurants(
  ) async {
    
    final result = await _fetchRestaurants(NoParams(
      
    ));
    return result.fold(
      (failure) {
        
       return Left(Failure(failure.message));
      },
      (success) {
       
        return Right(success);
      },
    );
  }
}
