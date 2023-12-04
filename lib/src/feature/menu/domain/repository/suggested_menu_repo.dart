import 'package:dartz/dartz.dart';

import 'package:foodivoire/src/feature/menu/domain/entities/suggested_menu_model.dart';

import '../../../../shared/errors/failure.dart';


abstract class SuggestedMenuRepo {
  Future<Either<Failure, List<SuggestedMenuDataModel>>> fetchSuggestedMenus(
 
  );

}
