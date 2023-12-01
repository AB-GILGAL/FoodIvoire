import 'dart:io';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/menu/data/api/suggested_menu_api_service.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/suggested_menu_model.dart';
import 'package:foodivoire/src/feature/menu/domain/repository/suggested_menu_repo.dart';
import 'package:foodivoire/src/shared/errors/exception.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';

class SuggestedMenuRepoImpl implements SuggestedMenuRepo {
  final SuggestedMenuApiService api;

  SuggestedMenuRepoImpl(this.api);

  @override
  Future<Either<Failure, List<SuggestedMenuDataModel>>> fetchSuggestedMenus()async {
    try {
      final result = await api.fetchSuggestedMenus();
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