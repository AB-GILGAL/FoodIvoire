import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/popular_menu_model.dart';

import '../../../../shared/errors/failure.dart';


abstract class PopularMenuRepo {
  Future<Either<Failure, List<PopularMenuDataModel>>> fetchPopularMenus(
 
  );

}
