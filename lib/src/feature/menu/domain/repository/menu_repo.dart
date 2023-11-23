import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/menu_model.dart';

import '../../../../shared/errors/failure.dart';


abstract class MenuRepo {
  Future<Either<Failure, List<MenuDataModel>>> fetchMenus(
 
  );

}
