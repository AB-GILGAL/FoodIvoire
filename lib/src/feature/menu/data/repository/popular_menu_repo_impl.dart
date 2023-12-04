import 'dart:io';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/menu/data/api/popular_menu_api_service.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/popular_menu_model.dart';
import 'package:foodivoire/src/feature/menu/domain/repository/popular_menu_repo.dart';
import 'package:foodivoire/src/shared/errors/exception.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';

class PopularMenuRepoImpl implements PopularMenuRepo {
  final PopularMenuApiService api;

  PopularMenuRepoImpl(this.api);

  @override
  Future<Either<Failure, List<PopularMenuDataModel>>> fetchPopularMenus()async {
    try {
      final result = await api.fetchPopularMenus();
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