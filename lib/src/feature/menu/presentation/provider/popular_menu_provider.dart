import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/menu_model.dart';
import 'package:foodivoire/src/feature/menu/domain/usecase/fetch_popular_menu.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';
import 'package:foodivoire/src/shared/utils/usecase.dart';


class PopularMenuProvider extends ChangeNotifier {
  final FetchPopularMenus _fetchPopularMenus;

  PopularMenuProvider(
      {required FetchPopularMenus fetchPopularMenus,
})
      : _fetchPopularMenus = fetchPopularMenus;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(loading) {
    _isLoading = loading;
  }

  //fetch Vendors 
  Future<Either<Failure, List<MenuDataModel>>> fetchPopularMenus(
  ) async {
    
    final result = await _fetchPopularMenus(NoParams(
      
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
