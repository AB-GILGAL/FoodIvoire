import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/Vendors/domain/entities/vendor_model.dart';

import '../../../../shared/errors/failure.dart';


abstract class RestaurantRepo {
  Future<Either<Failure, List<RestaurantDataModel>>> fetchRestaurants(
 
  );

}
