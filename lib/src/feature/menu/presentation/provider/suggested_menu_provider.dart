import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/menu_model.dart';
import 'package:foodivoire/src/feature/menu/domain/usecase/fetch_suggested_menu.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';
import 'package:foodivoire/src/shared/utils/usecase.dart';


class SuggestedMenuProvider extends ChangeNotifier {
  final FetchSuggestedMenus _fetchSuggestedMenus;

  SuggestedMenuProvider(
      {required FetchSuggestedMenus fetchSuggestedMenus,
})
      : _fetchSuggestedMenus = fetchSuggestedMenus;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(loading) {
    _isLoading = loading;
  }

  //fetch Vendors 
  Future<Either<Failure, List<MenuDataModel>>> fetchSuggestedMenus(
  ) async {
    
    final result = await _fetchSuggestedMenus(NoParams(
      
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
