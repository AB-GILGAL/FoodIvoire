import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/menu_model.dart';
import 'package:foodivoire/src/feature/menu/domain/usecase/fetch_menu.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';
import 'package:foodivoire/src/shared/utils/usecase.dart';


class MenuProvider extends ChangeNotifier {
  final FetchMenus _fetchMenus;

  MenuProvider(
      {required FetchMenus fetchMenus,
})
      : _fetchMenus = fetchMenus;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(loading) {
    _isLoading = loading;
  }

  //fetch Vendors 
  Future<Either<Failure, List<MenuDataModel>>> fetchMenus(
  ) async {
    
    final result = await _fetchMenus(NoParams(
      
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
