import 'dart:io';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:foodivoire/src/feature/menu/data/api/api_service.dart';
import 'package:foodivoire/src/feature/menu/domain/entities/menu_model.dart';
import 'package:foodivoire/src/feature/menu/domain/repository/menu_repo.dart';
import 'package:foodivoire/src/shared/errors/exception.dart';
import 'package:foodivoire/src/shared/errors/failure.dart';

class MenuRepoImpl implements MenuRepo {
  final MenuApiService api;

  MenuRepoImpl(this.api);

  @override
  Future<Either<Failure, List<MenuDataModel>>> fetchMenus()async {
    try {
      final result = await api.fetchMenus();
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